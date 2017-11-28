if Meteor.isClient

	@makePdf =
		card: ->
			doc = coll.pasien.findOne()
			pdf = pdfMake.createPdf
				content: [
					'Nama: ' + doc.regis.nama_lengkap
					'No. MR: ' + doc.no_mr
				]
				pageSize: 'B8'
				pageMargins: [110, 50, 0, 0]
				pageOrientation: 'landscape'
			pdf.download doc.no_mr + '_card.pdf'
		consent: ->
			doc = coll.pasien.findOne()
			pdf = pdfMake.createPdf
				content: [
					{text: 'PEMERINTAH PROVINSI RIAU\nRUMAH SAKIT UMUM DAERAH PETALA BUMI\nJL. Dr. Soetomo No. 65, Telp. (0761) 23024', alignment: 'center'}
					'\nDATA UMUM PASIEN'
					'\nNAMA LENGKAP : ' + doc.regis.nama_lengkap
					'TEMPAT & TANGGAL LAHIR : ' + doc.regis.tmpt_lahir + ', tanggal ' + moment(doc.regis.tgl_lahir).format('D/MMMM/YYYY')
					'GOLONGAN DARAH : ' + doc.regis.darah
					'JENIS KELAMIN : ' + doc.regis.kelamin
					'AGAMA : ' + doc.regis.agama
					'PENDIDIKAN : ' + doc.regis.pendidikan
					'PEKERJAAN : ' + doc.regis.pekerjaan
					'NAMA AYAH : ' + doc.regis.ayah
					'NAMA IBU : ' + doc.regis.ibu
					'NAMA SUAMI/ISTRI : ' + doc.regis.pasangan
					'ALAMAT : ' + doc.regis.alamat
					'NO. TELP / HP : ' + doc.regis.kontak
					'\nPERSETUJUAN UMUM (GENERAL CONSENT)'
					'\nSaya akan mentaati peraturan yang berlaku di RSUD Petala Bumi'
					'Saya memberi kuasa kepada dokter dan semua tenaga kesehatan untuk melakukan pemeriksaan / pengobatan / tindakan yang diperlakukan upaya kesembuhan saya / pasien tersebut diatas'
					'Saya memberi kuasa kepada dokter dan semua tenaga kesehatan yang ikut merawat saya untuk memberikan keterangan medis saya kepada yang bertanggung jawab atas biaya perawatan saya.'
					'Saya memberi kuasa kepada RSUD Petala Bumi untuk menginformasikan identitas sosial saya kepada keluarga / rekan / masyarakat'
					'Saya mengatakan bahwa informasi hasil pemeriksaan / rekam medis saya dapat digunakan untuk pendidikan / penelitian demi kemajuan ilmu kesehatan'
					'\nPetunjuk :'
					'S: Setuju'
					'TS: Tidak Setuju'
					{text: 'Pekanbaru,                        .\n\n\n__________________', alignment: 'right'}
				]
			pdf.download doc.no_mr + '_consent.pdf'
		payRawat: ->
			doc = coll.pasien.findOne()
			pdf = pdfMake.createPdf
				content: [
					{text: 'PEMERINTAH PROVINSI RIAU\nRUMAH SAKIT UMUM DAERAH PETALA BUMI\nJL. DR. SOETOMO NO. 65, TELP. (0761) 23024, PEKANBARU', alignment: 'center'}
					'\nRINCIAN BIAYA RAWAT JALAN'
					'IDENTITAS PASIEN'
					'NO. MR'
					'NAMA PASIEN'
					'JENIS KELAMIN'
					'TANGGAL LAHIR'
					'UMUR'
					'KLINIK'
					'RINCIAN PEMBAYARAN'
					'TOTAL BIAYA'
					'\nPEKANBARU, ' + moment().format('DD MM YYYY')
					'PETUGAS'
				]
			pdf.download doc.no_mr + '_payRawat.pdf'
		payRegCard: (amount, words) ->
			doc = coll.pasien.findOne()
			pdf = pdfMake.createPdf
				content: [
					text: 'PEMERINTAH PROVINSI RIAU', alignment: 'center'
				,
					text: 'RUMAH SAKIT UMUM DAERAH PETALA BUMI', alignment: 'center'
				,
					text: 'JL. DR. SOETOMO NO. 65, TELP. (0761) 23024, PEKANBARU', alignment: 'center'
					'\nKARCIS'
					'TANGGAL : ' + moment().format('DD MM YYYY')
					'NO. MR : ' + doc.no_mr
					'NAMA PASIEN : ' + doc.regis.nama_lengkap
					'\nTARIF : Rp ' + amount
				,
					text: '(' + words + ')', italics: true
				]
			pdf.download doc.no_mr + '_payRegCard.pdf'