import 'package:watch_app/features/shipping/model/address.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return const [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: '123 Main Street, Apt 48',
        city: 'New York',
        state: 'NY',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office',
        fullAddress: '456 Business Ave, Floor 5',
        city: 'San Francisco',
        state: 'CA',
        zipCode: '94105',
        isDefault: false,
        type: AddressType.office,
      ),

      Address(
        id: '3',
        label: 'Parents\' House',
        fullAddress: '789 Family Road',
        city: 'Chicago',
        state: 'IL',
        zipCode: '60616',
        isDefault: false,
        type: AddressType.home,
      ),

    ];
  }


  Address? getDefaultAddress(){
       return getAddresses().firstWhere(
        (address)=>  address.isDefault,
        orElse: () => getAddresses().first,
       );
  }
}
