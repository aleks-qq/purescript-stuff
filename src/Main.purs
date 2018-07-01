module Main where

import Prelude

import Effect.Uncurried (mkEffectFn1)
import React.Basic as R
import React.Basic.DOM as RB

type ExampleProps =
  { label :: String
  }

type ExampleState =
  { counter :: Int
  }

example :: R.ReactComponent ExampleProps
example = R.react
  { initialState
  , render
  , displayName: "something"
  , receiveProps: \_ _ _ -> pure unit
  }
  where
    initialState = { counter: 0 }
    render { label } { counter } setState =
      RB.button
        { onClick: mkEffectFn1 \_ -> do
            setState _ { counter = counter + 1 }
        , children: [ RB.text (label <> ": " <> show counter)]
        }
        