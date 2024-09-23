module MyModule::TokenBurn {

    use aptos_framework::coin;
    use aptos_framework::signer;

    // A "dead" address used for token burning
    const BURN_ADDRESS: address = @0x0;

    // Function to burn a specified amount of tokens by sending them to the burn address
    public fun burn_tokens<TokenType: store>(owner: &signer, amount: u64) {
        // Transfer the specified amount of tokens to the burn address (0x0)
        coin::transfer<TokenType>(owner, BURN_ADDRESS, amount);
    }

    // Function to check the remaining balance of tokens after burning
    public fun check_balance<TokenType: store>(account: address): u64 {
        coin::balance<TokenType>(account)
    }
}
