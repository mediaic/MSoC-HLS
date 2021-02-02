
filenames = []
fo = open('weights.h', 'w+')
fo.write('typedef float data_type;\n')
name_ary = ['data_type kernel1_weight[11][11][1][64]',
			'data_type kernel2_weight[1][1][64][32]',
			'data_type kernel3_weight[7][7][32][1]',
			'data_type kernel4_weight[11][11][1][64]',
			'data_type kernel5_weight[1][1][64][32]',
			'data_type kernel6_weight[7][7][32][1]',]
name_ary2 = ['data_type kernel1_bias[64]',
			'data_type kernel2_bias[32]',
			'data_type kernel3_bias[1]',
			'data_type kernel4_bias[64]',
			'data_type kernel5_bias[32]',
			'data_type kernel6_bias[1]',]
for i in range(1,7):
	# read conv weight
	f = open('model_weights/ReconNet_conv%d.txt' % i)
	L = f.readlines()
	Lo = []
	for t in L:
		for char in ['\n', '\'', '[', ']']:
			t = t.replace(char,'')
		n_ary = t.split(' ')
		for n in n_ary:
			if n!='':
				Lo.append(n)
	fo.write('%s = {%s' %(name_ary[i-1], Lo[0]))
	for j in range(1,len(Lo)):
		fo.write(', %s'%Lo[j])
	fo.write('};\n')
	# read bias weight
	f = open('model_weights/ReconNet_bias%d.txt' % i)
	L = f.readlines()
	Lo = []
	for t in L:
		for char in ['\n', '\'', '[', ']']:
			t = t.replace(char,'')
		n_ary = t.split(' ')
		for n in n_ary:
			if n!='':
				Lo.append(n)
	fo.write('%s = {%s' %(name_ary2[i-1], Lo[0]))
	for j in range(1,len(Lo)):
		fo.write(', %s'%Lo[j])
	fo.write('};\n')
fo.close()