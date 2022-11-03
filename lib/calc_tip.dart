calculateTotalPerPerson(double totalTip, double billAmount, int person) {
    var totalPerPerson = (totalTip + billAmount) / person;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int person, int tip) {
    double totalTip = 0.0;

    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
     
    } else {
      totalTip = (billAmount * tip) / 100;
    }
    return totalTip;
  }

  

