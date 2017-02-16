module Components.ChartView exposing ( .. )

import Chart as C exposing ( .. )
import Html exposing ( Html, div )
import Html.Attributes exposing ( id, class )


-- MODEL

type alias Model =
  List ( Float, String )

initialModel: Model
initialModel = 
  [
    ( 45.3, "Fox Dropper 150mm / 30.9mm" )
  , ( 40.1, "Rockshox reverb 125mm / 30.9" )
  ]


-- MESSAGE

type Msg = 
  Dummy


-- UPDATE

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ( model, Cmd.none )


-- VIEW

view : Model -> Html Msg
view model = 
  div [id "main" ]
      [
        vBar model
        |> C.title "Dropper Post Eval"
        |> toHtml
      ]
