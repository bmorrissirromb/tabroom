/* jshint indent: 4 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('category', { 
		name: {
			type: DataTypes.STRING(32),
			allowNull: false,
			defaultValue: ''
		},
		abbr: {
			type: DataTypes.STRING(8),
			allowNull: true
		}
	});
};

