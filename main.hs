import Noise

main = do
    -- Define grid dimensions
    let w = 64
        h = 64

    -- Print PGM header info
    putStrLn "P2"
    putStrLn $ show w ++ " " ++ show h ++ " 256"

    -- Output white pixel
    mapM putStrLn (replicate (w*h) "256")
