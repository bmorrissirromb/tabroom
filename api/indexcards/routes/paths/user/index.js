// These paths are ones that require a logged in user but are outside the scope
// of tournament administration.  Typically these are registration & user
// account functions.
import login from '../../../controllers/user/account/login'; // Except this one doesn't require a logged in user
import getProfile from '../../../controllers/user/account/getProfile';
import ipLocation from '../../../controllers/user/account/ipLocation';
import acceptPayPal from '../../../controllers/user/enter/acceptPayPal';
import judge from './judge';

export default [
	{ path: '/login', module : login },
	{ path: '/user/profile', module : getProfile },
	{ path: '/user/profile/{person_id}', module : getProfile },
	{ path: '/user/iplocation/{ip_address}', module: ipLocation },
	{ path: '/user/enter/payment', module : acceptPayPal },
	...judge,
];
