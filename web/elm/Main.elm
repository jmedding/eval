port module Main exposing (..)

import Html exposing (Html, programWithFlags, div)
import Html.Attributes as H exposing (class, id)

import Components.Measure as Measure
import Components.Product as Product
import Components.ChartView as ChartView
import Components.Results as Results
import Components.Excluder as Excluder
import Components.Settings as Settings

import Debug exposing ( log )



-- MODEL

type alias AppModel =
  { productList : List Product.Model
  , measureList : List Measure.Model
  , excluderList : List Excluder.Model
  , results : ChartView.Model
  , settings : Settings.Settings
  }


initialModel : AppModel
initialModel =
  let 
    excluders = ( Excluder.initialExcluders initialProducts )

  in
    { productList = initialProducts
    , measureList = Measure.initialMeasures
    , excluderList = excluders
    , results = Results.getResults excluders Measure.initialMeasures initialProducts
    , settings = Settings.Settings [] []
    }

init : Maybe Settings.Settings -> ( AppModel, Cmd Msg )
init settings =
  let
    model = initialModel
    startModel = case settings of
      Just settings ->
        { model | measureList = ( Settings.restoreMeasures settings model.measureList ) 
        , settings = settings
        }

      Nothing ->
        model 

  in
    ( startModel, Cmd.map ProductMsg Product.fetchProducts )


initialProducts : List Product.Model
initialProducts =  []


-- VIEW

view : AppModel -> Html Msg
view model =
  div [ class "elm-app" ] 
  [ div [ class "row" ]
    [ div [class "col-lg-12", id "chart" ] 
      [ Html.map ChartMsg ( ChartView.view model.results ) ]
    ]
  , div [ class "row" ] 
    [ div [ class "col-lg-5", id "measures" ]
      [ div [ class "row" ] ( measureListView model.measureList )
      , div [ class "row" ] ( excluderListView model.excluderList )
      ] 
    , div [ class "col-lg-2" ] []
    , div [ class "col-lg-5", id "products"] (productListView model.productList)
    ] 
  ]

productListView : List Product.Model -> List (Html Msg)
productListView products = 
  List.map(\ product -> Html.map ProductMsg (Product.view product)) products 


measureListView : List Measure.Model -> List (Html Msg)
measureListView measures =
  List.map(\ measure -> Html.map MeasureMsg ( Measure.view measure)) measures


excluderListView : List Excluder.Model -> List (Html Msg)
excluderListView excluders =
  List.map(\ excluder -> Html.map ExcluderMsg (Excluder.view excluder )) excluders


-- MESSAGES

type Msg =
  MeasureMsg Measure.Msg 
  | ProductMsg Product.Msg
  | ChartMsg ChartView.Msg
  | ExcluderMsg Excluder.Msg


-- UPDATE

update : Msg -> AppModel -> ( AppModel, Cmd Msg)
update message model = 
  case message of
    MeasureMsg subMsg ->
      let 
        (updatedMeasureList, measureCmd ) =
          Measure.update subMsg model.measureList
  
        updatedResults =
          Results.getResults model.excluderList updatedMeasureList model.productList

        settings = 
          Settings.buildSettings updatedMeasureList model.excluderList

      in
        ( { model | 
              measureList = updatedMeasureList
            , results = updatedResults
            , settings = settings
          }
          , Cmd.batch [ setStorage settings, (Cmd.map MeasureMsg measureCmd) ]
        )
    

    ProductMsg subMsg ->
      let
        ( updatedProducts, productCmd ) = 
          Product.update subMsg model.productList

        updatedExcluders = case subMsg of 
          Product.Fetch ->  model.excluderList
          Product.Filter partNo -> model.excluderList
          Product.Freshproducts result -> 
            updatedProducts
            |> Excluder.initialExcluders
            |> Settings.restoreExcluders model.settings

        updatedResults = (Results.getResults updatedExcluders model.measureList updatedProducts)
        
        settings = Settings.buildSettings model.measureList updatedExcluders
      in
        ( { model | 
              productList = updatedProducts
            , results = updatedResults
            , excluderList = updatedExcluders
            , settings = settings
          }
          , Cmd.batch [ setStorage settings, (Cmd.map ProductMsg productCmd ) ]
        )

    ChartMsg subMsg ->
      let ( updatedChartModel, chartCmd ) = 
            ChartView.update subMsg model.results

      in
        ( {model | results = updatedChartModel }, Cmd.map ChartMsg chartCmd )

    ExcluderMsg subMsg ->
      let 
        ( updatedExcluders, excluderCmd ) =
            Excluder.update subMsg model.excluderList

        updatedResults =
            Results.getResults updatedExcluders model.measureList model.productList  

        newModel = { model | 
              excluderList = updatedExcluders
            , results = updatedResults
          }

        settings =
          Settings.buildSettings newModel.measureList newModel.excluderList

      in
        ( { newModel | settings = settings }
          , Cmd.batch [ setStorage settings, (Cmd.map ExcluderMsg excluderCmd) ]
        )

--SUBSCRIPTIONS

subscriptions : AppModel -> Sub Msg
subscriptions model =
  Sub.none



-- APP
main : Program (Maybe Settings.Settings) AppModel Msg
main =
  programWithFlags
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions  
    }

port setStorage : Settings.Settings -> Cmd msg
