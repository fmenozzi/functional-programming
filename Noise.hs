import Data.Bits
import Data.Int

-- Integer noise function
inf2 :: Int32 -> Int32 -> Double
inf2 x y = 1.0 - (fromIntegral j / 1073741824.0)
           where
               m = x + y*57
               n = (shiftR m 13) `xor` m
               j = (n * (n*n*15731 + 789221) + 1376312589) .&. 0x7fffffff

-- Linear interpolation
lerp :: Double -> Double -> Double -> Double
lerp x y w = if w < 0 || w > 1 then
                 error ("Invalid weight: " ++ show w)
             else
                 x*(1.0-w) + y*w

-- Bilinear interpolation
bilerp :: Double -> Double -> Double -> Double -> Double -> Double -> Double
bilerp ll lr ul ur wx wy = lerp lower upper wy
                         where
                             lower = lerp ll lr wx
                             upper = lerp ul ur wx

-- 2D value noise
noise2 :: Double -> Double -> Double
noise2 x y = bilerp ll lr ul ur wx wy
             where
                 ix = floor x :: Int32
                 iy = floor y :: Int32
                 ll = inf2 (ix+0) (iy+0)
                 lr = inf2 (ix+1) (iy+0)
                 ul = inf2 (ix+0) (iy+1)
                 ur = inf2 (ix+1) (iy+1)
                 wx = x - fromIntegral (floor x)
                 wy = y - fromIntegral (floor y)