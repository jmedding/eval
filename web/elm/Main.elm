module Main exposing (..)

import Html exposing (Html, program, div)
import Html.Attributes as H exposing (class, id)

import Components.Measure as Measure
import Components.Product as Product
import Components.ChartView as ChartView

-- MODEL

type alias AppModel =
  { productList : List Product.Model
  , measureList : List Measure.Model
  , results : ChartView.Model
  }

initialModel : AppModel
initialModel =
  { productList = initialProducts
  , measureList = Measure.initialMeasures
  , results = ChartView.initialModel
  }

init : ( AppModel, Cmd Msg )
init = 
  ( initialModel, Cmd.none )


initialProducts : List Product.Model
initialProducts = 
  [ Product.Model "Rockshox" "001" "Reverb 125mm / 30.9mm" "30.9" 450 2 True
  , Product.Model "Fox" "101" "Dropper 150mm / 30.9mm" "30.9" 475 3 True
  ]


-- MESSAGES

type Msg =
  MeasureMsg Measure.Msg 
  | ProductMsg Product.Msg
  | ChartMsg ChartView.Msg

-- VIEW

view : AppModel -> Html Msg
view model =
  div [ class "elm-app" ] 
  [ div [ class "row" ]
    [ div [class "col-lg-12", id "chart" ] 
      [ Html.map ChartMsg ( ChartView.view model.results ) ]
    ]
  , div [ class "row" ] 
    [ div [ class "col-lg-5", id "measures" ] (measureListView model.measureList)
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

-- UPDATE

update : Msg -> AppModel -> ( AppModel, Cmd Msg)
update message model = 
  case message of
    MeasureMsg subMsg ->
      let 
        ( updatedMeasureList, measureCmd ) =
          Measure.update subMsg model.measureList

      in
        ( { model | measureList = updatedMeasureList }, Cmd.map MeasureMsg measureCmd )
    

    ProductMsg subMsg ->
      let 
        ( updatedProducts, productCmd ) = 
          Product.update subMsg model.productList
      in
        ( { model | productList = updatedProducts }, Cmd.map ProductMsg productCmd )

    ChartMsg subMsg ->
      let ( updatedChartModel, chartCmd ) = 
            ChartView.update subMsg model.results

      in
        ( {model | results = updatedChartModel }, Cmd.map ChartMsg chartCmd )


--SUBSCRIPTIONS

subscriptions : AppModel -> Sub Msg
subscriptions model =
  Sub.none



-- APP
main : Program Never AppModel Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions  
    }