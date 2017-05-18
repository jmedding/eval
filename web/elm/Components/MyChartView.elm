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
      , class "col-sm-12 eval-chart"
      ] ( titleRow :: itemRows items ) -- '::' joins two lists
  

titleRow: Html Msg
titleRow = 
  div [ class "row" ]
  [ h3 [] [ text "Dropper Post Rankings" ] ]

itemRows: Model -> List (Html Msg)
itemRows models =
  let
    rowFor = models |> getMaxValFromListOfResults |> itemRow  -- partial application

  in
    List.map rowFor models

itemRow: Float -> (Float, String) -> Html Msg
itemRow  maxVal (val, desc) =
  div [ class "row"]
  [ div [class "chart-item-desc col-sm-5" ] [ text desc ]
  , div [ class "col-sm-7" ] 
    [ div [ class "chart-bar"
          , style [ ("width", toString (val / maxVal * 100) ++ "%")]
          ] []
    ]
  ]

getMaxValFromListOfResults: Model -> Float
getMaxValFromListOfResults models =
  case models |> List.map (\(v,_)-> v) |> List.maximum of
    Just max -> max
    Nothing -> 1000.0