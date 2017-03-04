module Components.ChartView exposing ( .. )

import Chart as C exposing ( .. )
import Html exposing ( Html, div )
import Html.Attributes exposing ( id, class )


-- MODEL

type alias Model =
  List ( Float, String )


-- MESSAGE

type Msg = 
  Dummy


-- UPDATE

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  ( model, Cmd.none )


-- VIEW

view: Model -> Html Msg
view model = 
  div [id "main" ]
      [
        vBar model
        |> C.title "Dropper Post Eval"
        |> toHtml
      ]
