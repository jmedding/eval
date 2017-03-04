module Components.Product exposing ( .. )

import Html exposing ( Html, div, text, input )
import Html.Attributes exposing ( type_, class, checked )
import Html.Events exposing ( onClick )


-- MODEL

type alias PartNo = String

type alias Model = 
  { manufacturer : String 
  , partNo : PartNo
  , description : String
  , diameter : String
  , length : String
  , price : Float
  , reliability : Float
  , include : Bool
  }



-- MESSAGES



type Msg =
  Filter PartNo


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
    , text ( model.manufacturer ++ " " ++ model.description )
    ]


-- UPDATE

update : Msg -> List Model-> (List Model, Cmd Msg)
update msg products =
  case msg of 
    Filter partNo -> 
      ( toggle_include products partNo
      , Cmd.none
      )


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