# Web3.0
[Link](https://www.youtube.com/playlist?list=PL83mrTStE-sS5zCXlAQwbgCqntO6qIR5P)
## Video1
>
```
npm init -y
npm install --save-dev hardhat
$ npm start
npx hardhat compile
npx hardhat node 
npx harhadt test
npx hardhat run --network localhost scripts/deploy.ts
```
1. Install Hardhat
2. Connect with LocalHost
3.Basic Simple Hardhat Project
4. deploy in the localhost network
5. dotenv file 
6. Preparing script file

## Video2
>
```
npx hardhat run scripts/deploy.ts --network goerli
```
1. Deploy on Goerli Testnet
2. dashboard.alchemyapi.io - create App 
`` Enter name , description , environment = development , chain = ethereum , network= goerli``
3. This will give the HTTP key
4. Update env file and import in hardhat.config
5.Transaction can e viewed on goerli etherscan
6. Data Types 
``
string,
boolean ,
signed and unsigned integers
``
5. Variables
``
state,
Local ,
Global - block .number, block.timestamp, block.gaslimit, msg.value, msg.data, now
``
## Video3
>
``` string(abi.encodePacked(data1,data2))

   uint256[] arrayname;
   uint256 storage arrayName1 = arrayname;
   arrayName1.push("isallowed");
```
1. Variable Scope
`` Public , Internal , private``
2. Loops
`` For, Do while , While and Loop control  ``
3. Decision making
4. strings and bytes 
5. Arrays
`` fixed , dynamic can be created at state level``
6. Mapping 
`` mapping(address =>uint256) public mapuser; ``

## Video4
>
1. Enum - strings are costly when compared 
2. Struct 
3. Explicit and Implicit conversion
4. Ether units -smallest is 1 ether =  (1_000_000_000_000_000_000) wei
  - ethers.utils.parseEther("1"); 
  - const num = BidNumber.from("10000000000");
  - console.log("value in ether = ",ethers.utils.formatEther("num"));

## Video5
>
1. Functions 
2. Function Modifiers - 
  - pure (it doesnt access or modify state variables - no side effect on contract) 
  - view ( doesnt cost any fees - its only readonly )

3. Modifiers
4. Connect with different address in Script file andn since not Owner then will gice error
  - solidityTest4.connect(addr1).updateTreasureAddress(addr1.address);
5. Fallback and receive


  




