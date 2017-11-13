%define __jar_repack 0
Name: dcs-cnr-issia-spinua-step-5
Version: 1.0.11
Release: 1
Summary: Developer Cloud Sandbox SPINUA application Step 5
License: ${project.inceptionYear}, CNR ISSIA InSAR4Indo SPINUA, GPL
Distribution: CNR ISSIA InSAR4Indo SPINUA ${project.inceptionYear}
Group: air
Packager: Terradue
Provides: dcs-cnr-issia-spinua-step-5
Requires: snap-5.0
autoprov: yes
autoreq: no
Prefix: /application
BuildArch: noarch
BuildRoot: /home/khalidtijani/dcs-cnr-issia-spinua/target/rpm/dcs-cnr-issia-spinua-step-5/buildroot

%description
Developer Cloud Sandbox SPINUA application Step 5

%install
if [ -d $RPM_BUILD_ROOT ];
then
  mv /home/khalidtijani/dcs-cnr-issia-spinua/target/rpm/dcs-cnr-issia-spinua-step-5/tmp-buildroot/* $RPM_BUILD_ROOT
else
  mv /home/khalidtijani/dcs-cnr-issia-spinua/target/rpm/dcs-cnr-issia-spinua-step-5/tmp-buildroot $RPM_BUILD_ROOT
fi

%files
%defattr(777,root,ciop,777)
 "/application"
%attr(777,root,ciop)  "/application/interfconfig/run"
