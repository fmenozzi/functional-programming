import Noise

main = do
    -- Define grid dimensions
    let w = 256 :: Int
        h = 256 :: Int

    let wf = fromIntegral w
        hf = fromIntegral h

    let scale = 20.0

    -- Print PGM header info
    putStrLn "P2"
    putStrLn $ show w ++ " " ++ show h ++ " 256"

    -- Get list of pixel coords (zero-based indexing)
    let xy = [(x,y) | x <- [0..w-1], y <- [0..h-1]]

    -- Convert pixel coords to normalized uv-coords
    let uv = [(fromIntegral x / (wf-1) * scale, fromIntegral y / (hf-1) * scale) | (x,y) <- xy]

    -- Apply noise function to each uv-coord
    let noiseValues = [Noise.value u v | (u,v) <- uv]

    -- Remap noise values to grescale values
    let greyValues = [floor (256*(n+1)/2) | n <- noiseValues]
    mapM (putStrLn . show) greyValues
