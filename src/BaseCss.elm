port module BaseCss exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)

type CssIds
    = Container
    | Header
    | Links
    | List


type CssClass
    = Item

cssNamespace : Html.CssHelpers.Namespace String a b c
cssNamespace =
    withNamespace "navbar"

fileName : String
fileName = "navbar.css"

-- CSS Implementation
css : Stylesheet
css =
  (stylesheet << namespace cssNamespace.name)
    [ (#) Header
      [ backgroundColor (rgb 255 255 255)
      , fontWeight (int 400)
      , fontFamilies [ "Roboto", "Verdana", "Arial", .value sansSerif ]
      , fontSize (px 14)
      , displayFlex
      , flexDirection row
      , paddingTop (px 5)
      , paddingLeft (px 10)
      , paddingRight (px 10)
      ]
  , (#) Container
    [ backgroundColor (rgb 255 255 255)
    , width (pct 75)
    , children
      [ a
        [ paddingLeft (px 5)
        , display block
        , textDecoration none
        , backgroundColor transparent
        , children
          [ img
            [ marginTop (px 5)
            , height (px 30)
            , maxWidth (pct 100)
            , border (px 0)
            , verticalAlign bottom
            ]
          ]
        ]
      ]
    ]
  , (#) Links
    [ paddingRight (px 15)
    , children
      [ (#) List
        [ margin (px 0)
        , padding (px 0)
        , children
          [ (.) Item
            [
             display inlineBlock
            , children [
              a [
                display block
              , lineHeight (px 20)
              , position relative
              , fontSize (px 16)
              , textTransform uppercase
              , textDecoration none
              , padding2 (px 15) (px 15)
              ]
            ]
            ]
          ]
        ]
      ]
    ]
  ]
