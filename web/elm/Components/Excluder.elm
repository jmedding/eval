module Components.Excluder exposing ( .. )

import Html exposing ( Html, text, div, input )
import Html.Events exposing ( onCheck )
import Html.Attributes as H exposing ( class )
import Dict exposing ( Dict )
import Components.Product as Product


-- MODEL

type alias Model =
  ( String, Dict String Bool, Product.Model -> String )

buildExcluders: List (String, Product.Model -> String, String -> Bool) -> List Product.Model -> List Model
buildExcluders excluders products =
 List.map (\(label, getKeyFromProductFunc, defaulter) -> ( label, getDictForLabel getKeyFromProductFunc products defaulter, getKeyFromProductFunc )) excluders


getDictForLabel : ( Product.Model -> String ) -> List Product.Model -> (String -> Bool) -> (Dict String Bool)
getDictForLabel extractKeyFunc products defaulter =

    List.map extractKeyFunc products 
    |> List.sort
    |> List.map (\key -> (key, defaulter(key)))
    |> Dict.fromList


initialExcluders : List Product.Model -> List Model
initialExcluders products =
  let
    excluders = 
      -- (lable, function to extract key, function to set value of key (true or false))
      [ ("Diameter",     \product -> product.diameter, \key -> key == "30.9")
      , ("Length",       \product -> product.length, \key -> key == "150")
      , ("Brand", \product -> product.brand, \key -> True)
      , ("Actuator", \product -> product.actuator, \key -> True)
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
    |> List.sortBy ( \(key, val) -> padNum key )

  in
    List.map (\(key, val) -> checkbox label key val ) pairs


padNum : String -> String
padNum val =
  case String.toInt val of
    Err _ -> val
    Ok _  -> String.padLeft 5 ' ' val


checkbox : String -> String  -> Bool -> Html Msg
checkbox label key val =

    div [ class "col-sm-4" ]
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