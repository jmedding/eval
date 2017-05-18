module Components.Results exposing ( .. )

import Dict
import Components.Measure as Measure
import Components.Product as Product
import Components.MyChartView as MyChartView
import Components.Excluder as Excluder

import Debug exposing ( log )

getResults : List Excluder.Model -> List Measure.Model -> List Product.Model -> MyChartView.Model
getResults excluders measures products =
  let 
    selectedProducts = List.filter (\product -> product.include) products
    filteredProducts = excludeProducts excluders selectedProducts
    -- log = Debug.log "filteredProducts" filteredProducts
    primedFunction = primeFunction products
    measureFuncs = List.map primedFunction measures 
  in
    List.map (\ product -> applyMeasureFuncs measureFuncs product) filteredProducts
    |> List.sortBy ( \(rating, _) -> 0 - rating )

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
    description = product.brand ++ " " 
      ++ product.model ++ " ("
      ++ product.diameter ++ "/"
      ++ product.length ++ ")"

  in
    ( score, description )


excludeProducts : List Excluder.Model -> List Product.Model -> List Product.Model
excludeProducts excluders products =
  let
    checkExcluder product (label, dict, getFunc) =
      case ( Dict.get (getFunc product) dict ) of 
        Just False -> False
        Just True -> True
        Nothing -> False  -- will produce weird results. Would prefer to crash  with good message


    check product =
      List.all  (checkExcluder product) excluders

  in
    List.filter check products