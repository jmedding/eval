module Components.ReliabilityMeasure exposing (..)

import Html exposing (Html, Attribute, text, div, span, input)
import Html.Attributes as H exposing (class)
import Html.Events exposing (onInput)

-- MODEL

type alias Model = 
  { label : String
  , attribute : String
  , weight : Int
  , score : Float
  }

initialModel : Model

initialModel = 
  Model "Reliability" "reliability" 5 0.0



-- MESSAGES


type Msg = 
  Changed String



-- VIEW

view : Model -> Html Msg
view model =
  div [ class "row" ]
  [
    div [ class "row" ]
    [
      span [class "col-sm-10"] [ text model.label ],
      span [class "col-sm-2"] [ text ( toString model.weight ) ]
    ],
    
    div [class "row" ]
    [ 
      div [class "col-sm-12"] 
      [
          input [
            H.type_ "range",
            H.min "0",
            H.max "10", 
            H.step "1",
            H.value <| toString model.weight,
            onInput Changed
  
            ][]
        ]
    ]
  ]

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update (Changed v) model =
  ( {model | weight = String.toInt  v |> Result.withDefault 5 }, Cmd.none )