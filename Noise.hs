import Data.Bits
import Data.Int

-- 2D integer noise function
inf :: Int32 -> Int32 -> Double
inf x y = 1.0 - (fromIntegral j / 1073741824.0)
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

-- Cubic S-curve interpolation
clerp :: Double -> Double -> Double -> Double
clerp x y w = lerp x y cw
            where
                cw = ((-2)*w^3) + (3*w^2)

-- Quintic S-curve interpolation
qlerp :: Double -> Double -> Double -> Double
qlerp x y w = lerp x y qw
            where
                qw = 6*w^5 - 15*w^4 + 10*w^3

-- Bilinear interpolation
bilerp :: Double -> Double -> Double -> Double -> Double -> Double -> Double
bilerp ll lr ul ur wx wy = lerp lower upper wy
                         where
                             (lower, upper) = (lerp ll lr wx, lerp ul ur wx)

-- 2D value noise
value :: Double -> Double -> Double
value x y = bilerp ll lr ul ur wx wy
           where
               (ix, iy) = (floor x :: Int32, floor y :: Int32)
               (wx, wy) = (x - fromIntegral (floor x), y - fromIntegral (floor y))
               (ll, lr) = (inf (ix+0) (iy+0), inf (ix+1) (iy+0))
               (ul, ur) = (inf (ix+0) (iy+1), inf (ix+1) (iy+1))
