port module Stylesheets exposing (..)
import Css.File exposing (..)
import Html exposing (div)
import Html.App as Html

-- Styles
import BaseCss as Base

port files : CssFileStructure -> Cmd msg

-- Add each component style here
cssFiles : CssFileStructure
cssFiles =
  toFileStructure [
    ( Base.fileName, compile Base.css)
  ]

main : Program Never
main =
  Html.program
  { init = ( (), files cssFiles)
  , view = \_ -> (div [] [] )
  , update = \_ _ -> ( (), Cmd.none )
  , subscriptions = \_ -> Sub.none
  }
