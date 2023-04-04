pragma solidity 0.8.0;

contract SolidityScan{
 
 .....

    // Referenced from past Hacks
    uint256 private constant MAX = ~uint256(0);
    uint256 private _tTotal;
    uint256 private _rTotal;
    uint256 private _tFeeTotal;

    function excludeAccountInt(address account) internal {

        require(!_isExcluded[account], "Account is already excluded");
        if(_rOwned[account] > 0) {
            _tOwned[account] = tokenFromReflection(_rOwned[account]);
        }
        _isExcluded[account] = true;
        _excluded.push(account);
    } 
    function mintFromStaking(address to, uint256 amount) external {
        
        excludeAccountInt(to);

        _tTotal = _tTotal.add(amount);
        _rTotal = (MAX - (MAX % _tTotal));

        _tOwned[to] = _tOwned[to].add(amount);
        _rOwned[to] = _rOwned[to].add(amount);

        emit Transfer(address(0), to, amount);

        includeAccountInt(to);
    }
    .....
}