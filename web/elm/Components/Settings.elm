module Components.Settings exposing ( .. )

import Json.Encode as Encode
import Dict exposing ( Dict )
import Components.Measure as Measure
import Components.Excluder as Excluder



type alias Settings =
  { measures : List (String, Int)
  , excluders : List (String , List (String, Bool))
  }

buildSettings : List Measure.Model -> List Excluder.Model -> Settings
buildSettings appMeasures appExcluders =
  let
    measures = List.map (\m -> ( m.attribute, m.weight)) appMeasures
    excluders = List.map (\(name, dict, _) -> ( name, Dict.toList dict )) appExcluders

  in
    Settings measures excluders


-- Measures
restoreMeasures : Settings -> List Measure.Model -> List Measure.Model
restoreMeasures settings measures =
  let
    savedMeasures =
      settings.measures
      |> Dict.fromList
  in
    List.map (restoreMeasure savedMeasures) measures

restoreMeasure : Dict String Int -> Measure.Model -> Measure.Model
restoreMeasure dict measure =
  case Dict.get measure.attribute dict of
    Just val -> { measure | weight = val }
    Nothing -> measure


-- Excluders
restoreExcluders : Settings -> List Excluder.Model -> List Excluder.Model
restoreExcluders settings excluders =
  let
    savedExcluders = 
      settings.excluders 
      |> List.map (\ (key, list) -> (key, Dict.fromList list)) 
      |> Dict.fromList
  in
    List.map (restoreExcluder savedExcluders) excluders

restoreExcluder : Dict String (Dict String Bool) -> Excluder.Model -> Excluder.Model
restoreExcluder savedKeyVals (name, keyVals, func) =
  case Dict.get name savedKeyVals of
    Just dict -> 
      let 
        newKeys = Dict.diff keyVals dict
        updatedKeys = Dict.intersect dict keyVals
      in
        ( name, Dict.union newKeys updatedKeys, func)
    Nothing -> ( name, keyVals, func )