module Components.Results exposing ( .. )

import Components.Measure as Measure
import Components.Product as Product
import Components.ChartView as ChartView


getResults : List Measure.Model -> List Product.Model -> ChartView.Model
getResults measures products =
  let 
    primedFunction = primeFunction products
    measureFuncs = List.map primedFunction measures 
  in
    List.map (\ product -> applyMeasureFuncs measureFuncs product) products
      

primeFunction : List Product.Model -> Measure.Model -> (Product.Model -> Float)
primeFunction products measure =
-- Measure.Model.primeFunc is 
--    Int -> List Product.Model -> Product.Model -> Float
-- Will return the partially applied function that is primed with
-- a list of products. Can then be applied to each measure's primeFunc
-- and then all the measures' primeFuncs can be applied to each  product
  measure.primeFunc measure.weight products



applyMeasureFuncs : List (Product.Model -> Float) -> Product.Model -> ( Float, String )
applyMeasureFuncs measureFuncs product =
  let
    score = List.foldr (\func score-> score  + func product) 0 measureFuncs
    description = product.description

  in
    ( score, description )