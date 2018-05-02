%define __jar_repack 0
Name: dcs-gap-spinua-step-7
Version: 1.0.11
Release: 1
Summary: Developer Cloud Sandbox SPINUA application Step 7
License: ${project.inceptionYear}, CNR ISSIA InSAR4Indo SPINUA, GPL
Distribution: GAP srl InSAR4Indo SPINUA ${project.inceptionYear}
Group: air
Packager: Terradue
Provides: dcs-gap-spinua-step-7
Requires: snap-5.0
autoprov: yes
autoreq: no
Prefix: /application
BuildArch: noarch
BuildRoot: /home/khalidtijani/dcs-gap-spinua/target/rpm/dcs-gap-spinua-step-7/buildroot

%description
Developer Cloud Sandbox SPINUA application Step 7

%install
if [ -d $RPM_BUILD_ROOT ];
then
  mv /home/khalidtijani/dcs-gap-spinua/target/rpm/dcs-gap-spinua-step-7/tmp-buildroot/* $RPM_BUILD_ROOT
else
  mv /home/khalidtijani/dcs-gap-spinua/target/rpm/dcs-gap-spinua-step-7/tmp-buildroot $RPM_BUILD_ROOT
fi

%files
%defattr(777,root,ciop,777)
 "/application"
%attr(777,root,ciop)  "/application/pscandidate/run"
