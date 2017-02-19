module Components.Results exposing ( .. )

import Components.MeasureList as Measures exposing ( .. )
import Components.Product as Product exposing ( .. )


-- MODEL

type alias Model = 
  { product : Product.description
  , score : Float
  }

type Results 
  = List Model

type Score
  = Float


getResults : MeasureList.Model -> List Product.Model -> Results
getResults measures products =
  let 
    score = 0.0
  in
    score = 
      


productResult : Product -> List Product -> Model
productResult product products =

  score
  + measures.priceMeasureModel.weigh<t * product
