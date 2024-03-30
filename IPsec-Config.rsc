#
/ip ipsec policy group
add name=ikev2
/ip ipsec profile
add dh-group=modp1024 enc-algorithm=aes-256 lifetime=1h name=IKEv2
/ip ipsec peer
add address=20.234.57.39/32 disabled=yes exchange-mode=ike2 name=peer_azure \
    profile=IKEv2
/ip ipsec proposal
add auth-algorithms=sha256 disabled=yes enc-algorithms=aes-256-cbc lifetime=\
    1h name=IPsec_Proposal
/ip ipsec identity
add disabled=yes peer=peer_azure policy-template-group=ikev2
/ip ipsec policy
set 0 proposal=IPsec_Proposal
add disabled=yes dst-address=10.10.10.0/26 peer=peer_azure proposal=\
    IPsec_Proposal src-address=192.168.10.0/24 tunnel=yes
