module Simplicity.Jets.Tests where

import           Prelude                 hiding ( Word )

import           Test.Tasty
import           Test.Tasty.QuickCheck

import           Simplicity.Ty.Bit
import           Simplicity.Ty.Word
import           Simplicity.Programs.Word      as Simplicity
import           Simplicity.Jets.Word          as Jet

-- foreign import

tests :: TestTree
tests = testGroup
  "Jets"
  [ testGroup
    "Arith"
    [ testProperty "fullAdder word8"      prop_fullAdder8
    , testProperty "adder word8"          prop_adder8
    , testProperty "fullSubtractor word8" prop_fullSubtractor8
    , testProperty "subtractor word8"     prop_subtractor8
    , testProperty "fullMultiplier word8" prop_fullMultiplier8
    , testProperty "multiplier word8"     prop_multiplier8
    , testProperty "bitwiseNot word8"     prop_bitwiseNot8
    , testProperty "shift word8"          prop_shift8
    , testProperty "rotate word8"         prop_rotate8
    ]
  , testProperty "sha256" prop_sha256
  ]

prop_fullAdder8 :: Word Word8 -> ((Word8, Word8), Bit) -> Bool
prop_fullAdder8 = fullAddr
