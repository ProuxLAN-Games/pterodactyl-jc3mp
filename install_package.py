#/usr/bin/env python3

import json
import os


ROOT_PATH = "/home/container"
JSON_FILE = ROOT_PATH + "/package_list.json"


def main():
	file = open( JSON_FILE )
	data = json.load( file )

	for key in data:
		print( "Entering " + key + " directory" )
		os.chdir( ROOT_PATH + "/" + key )
		if not isinstance( data[ key ], list ):
			run( data[ key ] )
			continue
		for cmd in data[key]:
			run( cmd )
		print( "Exiting directory" )
		os.chdir( ROOT_PATH )

	file.close()  

def run( cmd ):
	print( "  Running command: " + cmd )
	os.system( cmd )


if __name__ == '__main__':
	main()
