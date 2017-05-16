module Components.MyChartView exposing ( .. )

import Html exposing ( Html, div, text, h3 )
import Html.Attributes exposing ( id, class, style )


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
view items = 
  div [id "eval-chart"
      , class "row"
      ] ( titleRow :: itemRows items )
  

titleRow: Html Msg
titleRow = 
  div [ class "row" ]
  [ h3 [] [ text "Dropper Post Rankings" ] ]

itemRows: Model -> List (Html Msg)
itemRows models =
  let
    maxVal = case models |> List.map (\(v,_)-> v) |> List.maximum of
      Just max -> max
      Nothing -> 1000
    rowFor = itemRow maxVal

  in
    List.map rowFor models

itemRow: Float -> (Float, String) -> Html Msg
itemRow  maxVal (val, desc) =
  div [ class "row"]
  [ div [class "chart-item-desc col-sm-2" ] [ text desc ]
  , div [ class "col-sm-10" ] 
    [ div [ class "chart-bar"
          , style [ ("width", toString (val / maxVal * 100) ++ "%")]
          ] []
    ]
  ]