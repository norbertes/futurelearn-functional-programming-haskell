-- import Data.Char
-- import Test.QuickCheck

shouldCipher :: Char -> Bool
shouldCipher c = isLetter(c) && isAscii(c)

cipcherChar :: Int -> Char -> Char
cipcherChar shift c
    | shouldCipher c = chr(ord(c) + shift)
    | otherwise      = c

wraparound shift c
    | isLower(c) && orc(c) + shift > ord 'z' = True
    | isUpper(c) && orc(c) + shift > ord 'Z' = True
    | otherwise = False

betterCipherChar :: Int -> Char -> Char
betterCipherChar shift c
    | shouldCipher c = chr(ord(c) + adjustedshift)
    | otherwise      = c
    where adjustedshift = let shift' = shift `mod` 26
                          in if (wraparound shift' c)
                              then shift'-26
                              else shift'

cipher :: Int -> [Char] -> [Char]
cipher shift plaintext = map (betterCipherChar shift) plaintext

decipher :: Int -> [Char] -> [Char]
decipher shift ciphertext = cipher (-shift) ciphertext

-- quickCheck ((\n -> (\s -> ((decipher n (cipher n s)) == s ))) :: Int -> [Char] -> Bool)
