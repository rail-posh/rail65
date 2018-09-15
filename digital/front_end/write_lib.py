# Python3 scripts for appengding cells to existing lib file 'rail65.lib'
# Please list all new cells in 'new_cell.txt' as follwing format (without comment):
##############################################
# 2 // number of new cells
# TGAT	// cell1 name
# 1.0	// cell1 area
# IN 	// cell1 input pins
# OUT	// cell1 output/inout pins
# TBUF	// cell2 name
# 2.0	// cell2 area
# I1 I2	// cell2 input pins, separate by tabs or spaces
# O1 O2 // cell2 output/inout pins, separate by tabs or spaces
##############################################

fw = open('rail65.lib')
lines = fw.readlines()
fw.close()
fw = open('rail65.lib','w')
fw.writelines([item for item in lines[:-1]])
fw.close()

with open('new_cell.txt', 'r') as f:
    new_cell = [line.rstrip('\n') for line in f]
    num = int(new_cell[0])
    i = 1
    for num_i in range(num):
        name = new_cell[i]
        if name =='':
            i+=1
            name = new_cell[i]
        i+=1
        area = new_cell[i]
        i+=1
        inputs = new_cell[i].split()
        i+=1
        outputs = new_cell[i].split()
        i+=1
        # Write to lib
        with open('rail65.lib','a') as fw:
            fw.write('\n\t/* ---------------------------- *\n')
            fw.write('\t * Design : {} *\n'.format(name))
            fw.write('\t * ---------------------------- */\n\n')
            fw.write('\tcell ({}) {{\n'.format(name))
            fw.write('\t\tarea : {};\n'.format(area))
            fw.write('\t\tpg_pin (VDD) {\n')
            fw.write('\t\t\tpg_type : primary_power;\n')
            fw.write('\t\t\tvoltage_name : COREVDD1;\n')
            fw.write('\t\t}\n\n')
            fw.write('\t\tpg_pin (VSS) {\n')
            fw.write('\t\t\t\tpg_type : primary_ground;\n')
            fw.write('\t\t\tvoltage_name : COREGND1;\n')
            fw.write('\t\t}\n\n')
            fw.write('\t\tleakage_power () {\n')
            fw.write('\t\t\tvalue : 0.280763;\n')
            fw.write('\t\t\trelated_pg_pin : VDD;\n')
            fw.write('\t\t}\n')
            for ip in inputs:
                fw.write('\t\tpin({}) {{\n'.format(ip))
                fw.write('\t\t\tdirection : input;\n')
                fw.write('\t\t\trelated_ground_pin : VSS;\n')
                fw.write('\t\t\trelated_power_pin : VDD;\n')
                fw.write('\t\t\tcapacitance : 0.001565;\n')
                fw.write('\t\t\trise_capacitance : 0.001482;\n')
                fw.write('\t\t\tfall_capacitance : 0.001565;\n')
                fw.write('\t\t}\n')
            for op in outputs:
                fw.write('\t\tpin({}) {{\n'.format(op))
                fw.write('\t\t\tdirection : output;\n')
                fw.write('\t\t\tpower_down_function : "!VDD + VSS";\n')
                fw.write('\t\t\tfunction : "({})";\n'.format(ip))
                fw.write('\t\t\trelated_ground_pin : VSS;\n')
                fw.write('\t\t\trelated_power_pin : VDD;\n')
                fw.write('\t\t\tthree_state : "(!{})";\n'.format(ip))
                fw.write('\t\t\tcapacitance : 0.005041;\n')
                fw.write('\t\t\trise_capacitance : 0.004861;\n')
                fw.write('\t\t\tfall_capacitance : 0.005041;\n')
                fw.write('\t\t\ttiming () {\n')
                fw.write('\t\t\t\trelated_pin : "{}";\n'.format(ip))
                fw.write('\t\t\t\ttiming_sense : negative_unate;\n')
                fw.write('\t\t\t\ttiming_type : combinational;\n')
                fw.write('\t\t\t}\n') 
                fw.write('\t\t}\n')
            fw.write('\t}\n\n')
            if num_i == num-1:
                fw.write('}\n')

