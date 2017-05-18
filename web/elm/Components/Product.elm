module Components.Product exposing ( .. )

import Html exposing ( Html, div, text, input )
import Http
import Html.Attributes exposing ( type_, class, checked )
import Html.Events exposing ( onClick )
import Json.Decode as Decode exposing ( Decoder, string, float, int )
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)

import Debug exposing ( log )

-- MODEL

type alias PartNo = String

type alias Model = 
  { brand : String 
  , partNo : PartNo
  , model : String
  , diameter : String
  , length : String
  , actuator : String
  , price : Float
  , reliability : Float
  , weight : Int
  }

fetchProducts : Cmd Msg
fetchProducts =
  let
    url = "/api/droppers"
    request = Http.get url ( decodeProductList )

  in
    Http.send Freshproducts request

decodeProductList : Decoder (List Model)
decodeProductList =
  Decode.field "droppers" (Decode.list decodeProduct)

decodeProduct : Decoder Model
decodeProduct =
  decode Model
    |> required "brand" string
    |> required "partNo" string
    |> required "model" string
    |> required "diameter" string
    |> required "length" string
    |> required "actuator" string
    |> required "price" float
    |> required "reliability" float
    |> required "weight" int


-- MESSAGES



type Msg =
  Fetch
  | Freshproducts (Result Http.Error (List Model))


-- VIEW

view : Model -> Html Msg
view model = 
  div 
    [ class "row" ]
    [ text ( description model )
    ]

description : Model -> String
description model =
  model.brand ++ " " 
  ++ model.model  ++ " " 
  ++ model.length ++ "mm/" 
  ++ model.diameter

-- UPDATE

update : Msg -> List Model-> (List Model, Cmd Msg)
update msg products =
  case msg of 
    Fetch -> ( products, fetchProducts )

    Freshproducts (Ok newProducts) -> 
      log "New Products" (newProducts, Cmd.none)

    Freshproducts ( Err _ ) ->
      log "error" ( products, Cmd.none )

