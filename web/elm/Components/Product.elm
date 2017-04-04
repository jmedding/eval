module Components.Product exposing ( .. )

import Html exposing ( Html, div, text, input )
import Http
import Html.Attributes exposing ( type_, class, checked )
import Html.Events exposing ( onClick )
import Json.Decode as Decode exposing ( Decoder, string, float )
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
  , price : Float
  , reliability : Float
  , include : Bool
  }

fetchProducts : Cmd Msg
fetchProducts =
  let
    url = "/api/droppers"
    request = Http.get url ( decodeProductList )

  in
    Http.send Freshroducts request

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
    |> required "price" float
    |> required "reliability" float
    |> hardcoded True


-- MESSAGES



type Msg =
  Filter PartNo
  | Fetch
  | Freshroducts (Result Http.Error (List Model))


-- VIEW

view : Model -> Html Msg
view model = 
  div 
    [ class "row" ]
    [ input [ 
              type_ "checkbox"
            , checked  model.include
            , onClick ( Filter model.partNo ) 
            ] []
    , text ( model.brand ++ " " ++ model.model  ++ " " ++ model.length ++ "mm/" ++ model.diameter)
    ]


-- UPDATE

update : Msg -> List Model-> (List Model, Cmd Msg)
update msg products =
  case msg of 
    Filter partNo -> 
      ( toggle_include products partNo
      , Cmd.none
      )

    Fetch -> ( products, fetchProducts )

    Freshroducts (Ok newProducts) -> 
      log "New Products" (newProducts, Cmd.none)

    Freshroducts ( Err _ ) ->
      log "error" ( products, Cmd.none )


toggle_include : List Model -> PartNo -> List Model
toggle_include products partNo =
  let
    updateProduct product =
      if product.partNo == partNo then
        { product | include = not product.include }
      else
        product
  in 
    List.map updateProduct products