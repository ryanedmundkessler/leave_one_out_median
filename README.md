# Computing leave-one-out median in Stata

This repo houses a [Stata](https://www.stata.com/) function that computes, for each observation, the median of variable excluding the given observation 

## Installation 

```stata
cap ado uninstall leave_one_out_median
net installl leave_one_out_median, from("https://raw.githubusercontent.com/ryanedmundkessler/leave_one_out_median/master/ado/")
```

## Example

Simple applications of leave_one_out_median can be found in [basic_functionality.do](./example/code/example.do)

## Unit Tests

Unit tests asserting basic functionality live in [basic_functionality.do](./test/code/basic_functionality.do)

## Authors 

Ryan Kessler
<br>Brown University
<br>Email: ryan.edmund.kessler@gmail.com

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details
