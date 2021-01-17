/// @description Wrap(value, min, max)
/// @function Wrap
/// @param value
/// @param min
/// @param max
// Returns the value wrapped, values over or under will be wrapped around
 
function Wrap(value, min, max){
	if (value mod 1 == 0)
	{
	    while (value > max || value < min)
	    {
	        if (value > max)
	            value += min - max - 1;
	        else if (value < min)
	            value += max - min + 1;
	    }
	    return(value);
	}
	else
	{
	    var vOld = value + 1;
	    while (value != vOld)
	    {
	        vOld = value;
	        if (value < min)
	            value = max - (min - value);
	        else if (value > max)
	            value = min + (value - max);
	    }
	    return(value);
	}
}