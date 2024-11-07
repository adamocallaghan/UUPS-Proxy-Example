-include .env

deploy-contract-a:
	forge script script/DeployContractA.s.sol --private-key $(ANVIL_PRIVATE_KEY)

call-inc-function-on-contract-a-via-proxy:
	cast send $(PROXY_ADDRESS) "inc(uint256)(uint256)" 5 --private-key $(ANVIL_PRIVATE_KEY)

check-amount-after-incrementing-the-number:
	cast send $(PROXY_ADDRESS) "getAmount()(uint256)" --private-key $(ANVIL_PRIVATE_KEY)

