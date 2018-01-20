defmodule Worker do

    def mine(serverPID, numofZeroes) do
        randString = :crypto.strong_rand_bytes(8) |> Base.encode16
        randString = "raghav29;" <> randString
        hashValue = Base.encode16(:crypto.hash(:sha256, randString))
        prefix = String.slice(hashValue,0,numofZeroes)
        requiredZeroes = String.pad_leading("", numofZeroes, "0")
        if(prefix == requiredZeroes) do
            bitCoin = randString <>"    "<> hashValue
            send serverPID, {:bitCoin, bitCoin}
        end
        mine(serverPID, numofZeroes)
    end
    
end
