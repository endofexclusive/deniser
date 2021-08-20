--  Copyright (C) 2020-2021 Martin Åberg
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--

library ieee;
use ieee.std_logic_1164.all;
library machxo3d;
use machxo3d.components;

entity oddr is
  port (
    clk : in  std_ulogic;
    d0  : in  std_ulogic;
    d1  : in  std_ulogic;
    q   : out std_ulogic
  );
end;

architecture rtl of oddr is
begin
  r : component components.oddrxe
  port map (
    d0    => d0,
    d1    => d1,
    sclk  => clk,
    rst   => '0',
    q     => q
  );
end;

