import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html

-- components
import BaseCss exposing (..)
{ id, class, classList } = cssNamespace --TODO doesn't work



main: Program Never
main =
  Html.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }

-- STATE
type alias State =
  {
  base: String
}

init: (State, Cmd Action)
init =
  ( State "base", Cmd.none)

-- UPDATE
type Action = NoOp

update : Action -> State -> ( State, Cmd Action)
update action state =
  ( state, Cmd.none)

-- VIEW
view : State -> Html Action
view state =
  header [id Header] [
    div [ id Container] [
      a [ href "http://www.google.com"] [
        (text "Home")
      ]
    ]
    ,nav [ id Links] [
      ul [ id List] [
        li [class [Item] ] [
          a [href "/user/login"] [
            (text "SIGN IN")
          ]
        ]
        ,li [class [Item] ] [
            a [  href "/user/register"] [
              (text "REGISTER")
            ]
          ]
        ,li [class [Item] ] [
          a [ href "http://blog.mozio.com"] [
            (text "BLOG")
          ]
        ]
      ]
    ]
  ]


-- SUBSCRIPTIONS
subscriptions : a -> Sub b
subscriptions = \_ -> Sub.none
