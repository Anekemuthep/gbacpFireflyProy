import Protolude
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck as QC
import qualified Data.Text as T

--import Algorithms.Gbacp (splitByTwoDots, getCustomAudience)

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [properties]

properties :: TestTree
properties = testGroup "Properties" [qcProps]

--baseDataText = "3535358358. sdffjgkf"

--unitTests = testGroup "Unit tests"
--    [ testCase "get Custom Audience working... " $
--        (getCustomAudience "segmento-1") `compare` Nothing @?= EQ
--    , testCase "get Custom Audience working... " $
--        (getCustomAudience "segmento-10") `compare` (Just ("6068529963872","Lookalike (CL 3%) - Segmento-10")) @?= EQ
--    , testCase "get Custom Audience working... " $
--        (getCustomAudience "segmento-7") `compare` Nothing @?= EQ
--    , testCase "get Custom Audience working... " $
--        (getCustomAudience "any-text") `compare` Nothing @?= EQ
    --, testCase "monoid Works.. "
    --    (Producto 2 `mappend` Producto 1) `compare` (Producto 2) @?= EQ
--    ]

intercambia :: (a,b) -> (b,a)
intercambia (x,y) = (y,x)

--prop_intercambia :: (Eq a) => a -> a -> Bool
--prop_intercambia x y =
--    intercambia (intercambia (x,y)) == (x,y)

qcProps = testGroup "(checked by QuickCheck)"
  [ QC.testProperty "sort == sort . reverse" $
        \list -> sort (list :: [Int]) == sort (reverse list)
  , QC.testProperty "Fermat's little theorem" $
        \x -> ((x :: Integer)^7 - x) `mod` 7 == 0
  , QC.testProperty "Identidad de Intercambia" $
        \x y -> intercambia (intercambia (x,y) :: (Int, Int)) == (x,y)
    -- the following property does not hold
 -- , QC.testProperty "Fermat's last theorem" $
 --       \x y z n ->
 --         (n :: Integer) >= 3 QC.==> x^n + y^n /= (z^n :: Integer)
  ]