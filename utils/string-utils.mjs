function isString(value) {
    const isNumber = Boolean(value.match(/^\d+$/));
    return !isNumber;
}

export { isString }