module Components.Excluder exposing ( .. )

import Html exposing ( Html, text, div, input )
import Html.Events exposing ( onCheck )
import Html.Attributes as H exposing ( class )
import Dict exposing ( Dict )
import Components.Product as Product


-- MODEL

type alias Model =
  ( String, Dict String Bool, Product.Model -> String )

buildExcluders: List (String, Product.Model -> String) -> List Product.Model -> List Model
buildExcluders excluders products =
 List.map (\(label, getKeyFromProductFunc) -> ( label, getDictForLabel getKeyFromProductFunc products, getKeyFromProductFunc )) excluders


getDictForLabel : ( Product.Model -> String ) -> List Product.Model -> (Dict String Bool)
getDictForLabel extractKeyFunc products =

    List.map extractKeyFunc products 
    |> List.sort 
    |> List.map (\key -> (key, True))
    |> Dict.fromList


initialExcluders : List Product.Model -> List Model
initialExcluders products =
  let
    excluders = 
      [ ("Diameter",     \product -> product.diameter)
      , ("Manufacturer", \product -> product.manufacturer)
      , ("Length",       \product -> product.length)
      ]

  in
    buildExcluders excluders products


-- MESSAGES

type Msg =
  FilterAttribute String String Bool  -- "Diameter" "30.9" True


-- VIEW

view : Model -> Html Msg
view (label, dict, func) = 
  div [ class "row" ] 
  [ div [ class "row excluderLabel" ] [ text label ]
  , div [ class "row" ]
    [div [ class "row" ] (checkboxesForKeys (label, dict, func))
    ]
  ]

checkboxesForKeys : Model -> List (Html Msg)
checkboxesForKeys (label, dict, _ ) =
  let 
    pairs = Dict.toList dict

  in
    List.map (\(key, val) -> checkbox label key val ) pairs


checkbox : String -> String  -> Bool -> Html Msg
checkbox label key val =

    div [ class "col-lg-4" ]
        [ input
          [ H.type_ "checkbox"
          , H.checked val
          , onCheck (FilterAttribute label key)
          ] []
        , text key
        ]



-- UPDATE

update : Msg -> List Model -> ( List Model, Cmd Msg )
update ( FilterAttribute label key val ) excluders =
  let
    updatedExcluders = updateExcluders excluders label key val

  in
    ( updatedExcluders, Cmd.none )


updateExcluders : List Model -> String -> String -> Bool -> List Model
updateExcluders excluders labelToUpdate key val =

  let
    updateExcluder ( label, dict, func ) = 
      if label == labelToUpdate then
        ( label, Dict.insert key val dict, func )
      else
        ( label, dict, func )

  in
    List.map updateExcluder excluders