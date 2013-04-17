task :import_planets => :environment do
  incoming = File.open('planets.csv', 'r')
  
  count = 0
  incoming.each_line do |line|
    count += 1
    next if count == 1
    rowid,pl_hostname,pl_letter,pl_discmethod,pl_orbper,pl_orbperlim,pl_orbpererr1,pl_orbpererr2,pl_massj,pl_masslim,pl_massjerr1,pl_massjerr2,pl_radj,pl_radlim,pl_radjerr1,pl_radjerr2,ra,dec,st_dist,st_disterr1,st_disterr2,st_distlim,st_vj,st_vjerr,st_vjlim,st_vjblend,st_teff,st_tefferr,st_tefflim,st_teffblend,st_mass,st_masserr,st_masslim,st_massblend,st_rad,st_raderr,st_radlim,st_radblend,hd_name,hip_name = line.strip.split(',').collect(&:strip)
    Planet.create! do |planet|
      planet.host_name = pl_hostname
      planet.planet_letter = pl_letter
      planet.discovery_method = pl_discmethod
      planet.orbital_period = pl_orbper
      planet.planet_mass = pl_massj
      planet.ra = ra
      planet.dec = dec
      planet.hd_host_name = hd_name
    end
  end
end