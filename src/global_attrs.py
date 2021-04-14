#!/usr/bin/env python

# This file was copied and adapted from ppnc (https://github.com/rcurr/ppnc)

# ppnc  Copyright (C) 2015  University of Cambridge

# Ppnc is free software: you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.

# Ppnc is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

# You should have received a copy of the GNU Lesser General Public License along
# with ppnc.  If not, see <http://www.gnu.org/licenses/>.

__version__ = "$Format:%h$"

import os.path
from datetime import datetime
import uuid

class global_attrs():
    def __init__(self, suiteid, variable_name, iris_version, member=1):
        self.attrs = {
            'activity_id': 'CCMI2022',
            'contact': 'N. Luke Abraham <n.luke.abraham@ncas.ac.uk>, James Keeble <james.keeble@ncas.ac.uk> ',
            'creation_date': '',  # a string representation of the date when the netCDF file was created in the format: 'YYYY-MM-DD-THH:MM:SSZ'. The 'T' and 'Z' are not modified, but the other variables are replaced with the correct time stamp. If using CMOR, this is generated automatically.'
            'data_specs_version': '01.00.00', # ‘01.00.00’ or similar (see variable tables for exact number)
            'data_version': '20210317', # may be changed, e.g. for corrections
            'experiment': 'Hindcast', # ‘Hindcast’, ‘Baseline projection using…’ (see CV.json for permitted options)
            'experiment_id': 'refD1', # ‘refD1’, ‘refD2’, ‘senD2-geo’, ‘senD2-ssp126’, ‘senD2-ssp370’
            'forcing_index': 2,
            'frequency': 'mon',  # e.g. 'yr', 'mon', 'day', 'subhr', 'fx' (for time-independent fields). Most of this data will be 'mon'. It's probably possible to work this out from the time points of the data.',
            'grid': 'N96L85 hybrid-theta (1.25 latitude by 1.875 longitude with 85 vertical levels up to 85km)',
            'grid_label': 'gn', # ‘gm’, ‘gn’, ‘gnz’, ‘gr’ (see CV.json for permitted options)
            'initialization_index': 1,
            'institute_id': 'U-CAMBRIDGE',
            'institution': 'National Centre for Atmospheric Science, Department of Chemistry, University of Cambridge, Lensfield Road, Cambridgre, CB2 1EW U.K.',
            'license': 'CCMI2022 model data produced by U-CAMBRIDGE is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (https://creativecommons.org/licenses). Consult http://blogs.reading.ac.uk/ccmi/ for terms of use governing CCMI output, including citation requirements and proper acknowledgment. The data producers and data providers make no warranty, either express or implied, including, but not limited to, warranties of merchantability and fitness for a particular purpose. All liabilities arising from the supply of the information (including any liability arising in negligence) are excluded to the fullest extent permitted by law.', # see pdf doc - may want to tweak
            'mip-era': 'CMIP6’',
            'nominal_resolution': '100 km',
            'physics_index': 1,
            'product': 'model-output',
            'realization_index': member,  # (for first set - this will change if we do additional ensemble members)
            'realm': 'atmos', # ‘atmos’, ‘land’
            'source': 'UKESM1-StratTrop2:\natmos: UKESM1 (N96L85; model top 85km) \natmosChem: StratTrop chemistry with improvements \nland: JULES \nocean: NEMO (ORCA1) \nseaIce CICE',
            'source_id': 'UKESM1-StratTrop2', # as registered
            'source_type': 'AER AGCM CHEM',
            'sub_experiment': 'none',
            'sub_experiment_id': 'none',
            'table_id': 'Amon', # see other options
            'tracking_id': '',  # To allow for possible future publication to the ESGF, tracking_id should be of the form “hdl:21.14100/<uuid>” (e.g., “hdl:21.14100/02d9e6d5-9467-382e-8f9b-9300a64ac3cd”). The tracking_id should be unique for each file. The <uuid> should be generated using the OSSP utility which supports a number of different DCE 1.1 variant UUID options. Here version 4 (random number based) is required. Download the software from http://www.ossp.org/pkg/lib/uuid/.
            'history': '',  
            #'references': """Some References.""",
            'variable_id': variable_name, # ‘ta’, ‘o3’, ‘ch4’, … Variable name as specified in the data request.
            'variant_label': '', # ‘r3i1p1f1’,… Combining realization_index, initialization_index, physics_index and forcing_index
        }

        self.freq_map = {  # Mappings for frequency in dirname
            'yr': 'annual',
            'mon': 'monthly',
            'day': 'daily',
            'fx': 'fixed',
            'subhr': 'hourly'
        }

        # need to pass a list to set_attrs
        if isinstance(suiteid,str):
            self.set_attrs([suiteid], iris_version)
        elif isinstance(suiteid,list):
            self.set_attrs(suiteid, iris_version)
            

    def set_attrs(self, suiteid, iris_version):
        # set things that are defined from time now etc.
        self.attrs['creation_date'] = datetime.now().strftime('%Y-%m-%d-T%H:%M:%SZ')
        self.attrs['tracking_id'] = str(uuid.uuid4())
        # set some further information in the 
        self.attrs['history'] = 'Model suite-ID(s) = %s. Created using Iris version %s.' % (', '.join(suiteid), iris_version)
        self.attrs['variant_label'] = 'r' + str(self.attrs['realization_index']) + 'i' + str(self.attrs['initialization_index']) + 'p' + str(self.attrs['physics_index']) + 'f' + str(self.attrs['forcing_index'])

    def gen_dirname(self):
        dirname = [
            self.attrs['activity_id'],              # CCMI2022
            self.attrs['product'],                  # model-output
            self.attrs['institute_id'],             # U-CAMBRIDGE
            self.attrs['source_id'],                # UKESM1-StratTrop2
            self.attrs['experiment_id'],            # refD1
            self.attrs['frequency'],                # mon
            self.attrs['realm'],                    # atmos
            self.freq_map[self.attrs['frequency']], # monthly
            self.attrs['variant_label'],            # r1i1p1f2 
            'v' + str(self.attrs['data_version']),  # v20210317
            self.attrs['variable_id']               # toz
        ]
    
        return os.path.join('',*dirname)

    def gen_filename(self,start_time,end_time):
        #filename = <variable_id>_<table_id>_<source_id>_<experiment_id>_<variant_label>_<grid_label>[_<time_range>].nc

        filename = [
            self.attrs['variable_id'], 
            self.attrs['table_id'], 
            self.attrs['source_id'], 
            self.attrs['experiment_id'],  
            self.attrs['variant_label'], 
            self.attrs['grid_label'], 
            start_time,
            end_time
        ]

        return '_'.join(filename) + '.nc'