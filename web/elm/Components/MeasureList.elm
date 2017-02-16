module Components.MeasureList exposing (..)

import Html exposing ( Html, Attribute, text, div )
import Html.Attributes as H exposing ( class )
import Html.Events exposing ( onInput )
import Components.PriceMeasure as PriceMeasure
import Components.ReliabilityMeasure as ReliabilityMeasure

--MODEL

type alias MeasureListModel = 
  { priceMeasureModel : PriceMeasure.Model
  , reliabilityMeasureModel : ReliabilityMeasure.Model
  }

initialModel : MeasureListModel
initialModel = 
  { priceMeasureModel = PriceMeasure.Model "Price" "price" 5 0.0
  , reliabilityMeasureModel = ReliabilityMeasure.Model "Reliability" "reliability" 5 0.0
  }


init : ( MeasureListModel, Cmd Msg )
init = 
  ( initialModel, Cmd.none )



--MESSAGES
type Msg = 
  PriceMeasureMsg PriceMeasure.Msg |
  ReliabilityMeasureMsg ReliabilityMeasure.Msg




-- VIEW

view : MeasureListModel -> Html Msg
view model =
  div [ class "col-lg-5" ] ( measureRows model )

measureRows : MeasureListModel -> List (Html Msg)
measureRows model = 
      [ Html.map PriceMeasureMsg (PriceMeasure.view model.priceMeasureModel )
      , Html.map ReliabilityMeasureMsg (ReliabilityMeasure.view model.reliabilityMeasureModel )
      ]


-- UPDATE

update : Msg -> MeasureListModel -> (MeasureListModel, Cmd Msg)
update msg model = 
  case msg of
    PriceMeasureMsg subMsg ->
      let 
        ( updatedPriceMeasure, priceMeasureCmd ) = 
          PriceMeasure.update subMsg model.priceMeasureModel
      in
        ( { model | priceMeasureModel = updatedPriceMeasure }, Cmd.map PriceMeasureMsg priceMeasureCmd )

    ReliabilityMeasureMsg subMsg ->
      let ( updatedReliabilityMeasure, reliabilityMeasureCmd ) = 
            ReliabilityMeasure.update subMsg model.reliabilityMeasureModel
      in
        ( {model | reliabilityMeasureModel = updatedReliabilityMeasure }, Cmd.map ReliabilityMeasureMsg reliabilityMeasureCmd )
