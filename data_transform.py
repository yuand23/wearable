import pandas as pd

def calmean(series1,step):
	mylist = []
	for i in range(step-1):
		mylist.append('')
	for i in range(len(series1)-step+1):
		tmpmean = series1[i:i+step].mean()
		tmpmean = round(tmpmean,2)
		mylist.append(tmpmean)
	return mylist

def calstd(series1,step):
	mylist = []
	for i in range(step-1):
		mylist.append('')
	for i in range(len(series1)-step+1):
		tmpstd = series1[i:i+step].std()
		tmpstd = round(tmpstd,2)
		mylist.append(tmpstd)
	return mylist
	
#mag

mag = pd.read_csv('mag_9f_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

mag['xmean'] = calmean(mag.x,15)
mag['ymean'] = calmean(mag.y,15)
mag['zmean'] = calmean(mag.z,15)
mag['norm_mean'] = calmean(mag.norm,15)

mag['xstd'] = calstd(mag.x,15)
mag['ystd'] = calstd(mag.y,15)
mag['zstd'] = calstd(mag.z,15)
mag['norm_std'] = calstd(mag.norm,15)

mag.to_csv('mag_9f_analysis.csv',sep=',',index=False)

#angv
angv = pd.read_csv('angv_9f_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

angv['xmean'] = calmean(angv.x,15)
angv['ymean'] = calmean(angv.y,15)
angv['zmean'] = calmean(angv.z,15)
angv['norm_mean'] = calmean(angv.norm,15)

angv['xstd'] = calstd(angv.x,15)
angv['ystd'] = calstd(angv.y,15)
angv['zstd'] = calstd(angv.z,15)
angv['norm_std'] = calstd(angv.norm,15)

angv.to_csv('angv_9f_analysis.csv',sep=',',index=False)

#grava
grava = pd.read_csv('grava_9f_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

grava['xmean'] = calmean(grava.x,15)
grava['ymean'] = calmean(grava.y,15)
grava['zmean'] = calmean(grava.z,15)
grava['norm_mean'] = calmean(grava.norm,15)

grava['xstd'] = calstd(grava.x,15)
grava['ystd'] = calstd(grava.y,15)
grava['zstd'] = calstd(grava.z,15)
grava['norm_std'] = calstd(grava.norm,15)

grava.to_csv('grava_9f_analysis.csv',sep=',',index=False)

del mag
del angv
del grava
print('9f finished')
#---------------------------------------------------------------
mag = pd.read_csv('mag_b7_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

mag['xmean'] = calmean(mag.x,15)
mag['ymean'] = calmean(mag.y,15)
mag['zmean'] = calmean(mag.z,15)
mag['norm_mean'] = calmean(mag.norm,15)

mag['xstd'] = calstd(mag.x,15)
mag['ystd'] = calstd(mag.y,15)
mag['zstd'] = calstd(mag.z,15)
mag['norm_std'] = calstd(mag.norm,15)

mag.to_csv('mag_b7_analysis.csv',sep=',',index=False)

#angv
angv = pd.read_csv('angv_b7_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

angv['xmean'] = calmean(angv.x,15)
angv['ymean'] = calmean(angv.y,15)
angv['zmean'] = calmean(angv.z,15)
angv['norm_mean'] = calmean(angv.norm,15)

angv['xstd'] = calstd(angv.x,15)
angv['ystd'] = calstd(angv.y,15)
angv['zstd'] = calstd(angv.z,15)
angv['norm_std'] = calstd(angv.norm,15)

angv.to_csv('angv_b7_analysis.csv',sep=',',index=False)

#grava
grava = pd.read_csv('grava_b7_clean.csv', header=0, index_col=False, names=['time','x','y','z','norm'])

grava['xmean'] = calmean(grava.x,15)
grava['ymean'] = calmean(grava.y,15)
grava['zmean'] = calmean(grava.z,15)
grava['norm_mean'] = calmean(grava.norm,15)

grava['xstd'] = calstd(grava.x,15)
grava['ystd'] = calstd(grava.y,15)
grava['zstd'] = calstd(grava.z,15)
grava['norm_std'] = calstd(grava.norm,15)

grava.to_csv('grava_b7_analysis.csv',sep=',',index=False)

print ('b7 finished')



