import fs from 'fs';

const getDeliveryZoneFile = async (path) => {
    try {
        const zones = await fs.readFileSync(path, 'utf8');
        return JSON.parse(zones);
    } catch (err) {
        console.log(err);
        const error = new createHttpError(500, `Couldn't get delivery zones, please try again later. ${err}`);
        return next(error);
    }
}


export const buildDeliveryZones = async () => {
    const zones = await getDeliveryZoneFile('./data/delivery-zones.json');
    const readyZones = zones.map(zone => {
        let zoneObj = zone.Description.replace('DELIVERY', '').trim();
        zoneObj = zoneObj.replace('ZONE', '').trim();
        zoneObj = zoneObj.replace('-ASK DISPATCH', '').trim();
        zoneObj = zoneObj.replace('SEE DISPATCH', '').trim();
        zoneObj = zoneObj.replace('SEE DISPATC', '').trim();
        zoneObj = zoneObj.replace('SEE DISP', '').trim();
        zoneObj = zoneObj.replace('DISP', '').trim();
        zoneObj = zoneObj.replace('DIRECT DEL CHARGE,', '').trim();
        zoneObj = zoneObj.replace('DISPATCH', '').trim();
        zoneObj = zoneObj.replace('OUTER DISPATCH', '').trim();
        zoneObj = zoneObj.replace('DELIVERY', '').trim();
        zoneObj = zoneObj.replace('DEL', '').trim();
        zoneObj = zoneObj.replace(/.[0-9]/, '').trim();
        zoneObj = zoneObj.replace(/[0-9]/g, '').trim();
        zoneObj = zoneObj.replace(/\./, '').trim();
        zoneObj = zoneObj.replace('-', '').trim();
        return { [zoneObj]: { Sku: zone.Sku, price: zone.Retail, description: zone.Description, zipCodes: [] } };
    });

    readyZones.sort((a, b) => {
        const aKey = Object.keys(a)[0];
        const bKey = Object.keys(b)[0];
        if (aKey < bKey) {
            return -1;
        }
        if (aKey > bKey) {
            return 1;
        }
        return 0;
    });

    console.log('Delivery Zones: ', readyZones);
    return readyZones;
}

export const getDeliveryZones = async () => {
    const zones = await getDeliveryZoneFile('./data/delivery-cities.json');
    return zones;
}