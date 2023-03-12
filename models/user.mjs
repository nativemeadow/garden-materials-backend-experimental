import uuid from 'uuidv4';
import { v4 as uuidv4 } from 'uuid';

class User {
  constructor(props) {
    Object.assign(this, props);

    console.log('User: ', this);

    delete this.passwordConfirmation;

    if (!props.id) {
      this.id = uuidv4();
    }
  }

  toArray() {
    return Object.keys(this).map((key) => [key, this[key]]);
  }

  toString() {
    return (
      this.user_id +
      ', ' +
      this.customer_type +
      ', ' +
      this.username +
      ', ' +
      this.password +
      ', ' +
      this.first_name +
      ', ' +
      this.last_name +
      ', ' +
      this.email +
      ', ' +
      this.type +
      ', ' +
      this.phone +
      ', ' +
      this.address +
      ', ' +
      this.city +
      ', ' +
      this.country +
      ', ' +
      this.state_province +
      ', ' +
      this.postal_code +
      ', ' +
      this.company
    );
  }

  toJSON() {
    return { ...this };
  }

  toUser() {
    return {
      id: this.id,
      customer_type: this.customer_type,
      username: this.username,
      password: this.password,
      first_name: this.first_name,
      last_name: this.last_name,
      email: this.email,
    }
  }

  toUserUpdate() {
    return {
      customer_type: this.customer_type,
      username: this.username,
      first_name: this.first_name,
      last_name: this.last_name,
      email: this.email,
      phone: this.phone,
    }
  }

  getCustomerTypeEum(type) {
    const customerType = {
      Registered: 1,
      Guest: 2,
    };
    return customerType[type];
  }

  toUpdateUser(currentUser) {
    let updatedUser = '';

    for (const key in this.toUserUpdate()) {
      if (this[key] && this[key] !== currentUser[key]) {
        updatedUser += `${key} = "${this[key]}",`;
      }
    }

    if (updatedUser.endsWith(',')) {
      return updatedUser.slice(0, -1);
    }

    return updatedUser;
  }

  toAddress() {
    return {
      user_id: this.id,
      type: this.type,
      phone: this.phone,
      address: this.address,
      city: this.city,
      state_province: this.state_province,
      postal_code: this.postal_code,
      country: this.country,
      company: this.company
    }
  }

  toAddressUpdate() {
    return {
      type: this.type,
      phone: this.phone,
      address: this.address,
      city: this.city,
      state_province: this.state_province,
      postal_code: this.postal_code,
      country: this.country,
      company: this.company
    }
  }

  getAddressTypeEum(type) {
    const addressType = {
      Billing: 1,
      Shipping: 2,
    };
    return addressType[type];
  }

  toUpdateAddress(currentUser) {
    let updatedAddress = '';

    for (const key in this.toAddressUpdate()) {
      if (this[key] && this[key] !== currentUser[key]) {
        updatedAddress += `${key} = "${this[key]}",`;
      }
    }

    if (updatedAddress.endsWith(',')) {
      return updatedAddress.slice(0, -1);
    }

    return updatedAddress;
  }

}

export default User;
