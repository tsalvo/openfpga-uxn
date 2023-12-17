-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 12
entity device_in_0CLK_6b74154c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_6b74154c;
architecture arch of device_in_0CLK_6b74154c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal device : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal REG_COMB_device : unsigned(7 downto 0);
signal REG_COMB_result : device_in_result_t;

-- Each function instance gets signals
-- BIN_OP_AND[uxn_device_h_l330_c11_7aa8]
signal BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l332_c6_972a]
signal BIN_OP_EQ_uxn_device_h_l332_c6_972a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l332_c6_972a_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l332_c1_9dcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c7_5705]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l332_c2_96fc]
signal result_MUX_uxn_device_h_l332_c2_96fc_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l332_c2_96fc_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l332_c2_96fc_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l332_c2_96fc_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l333_c12_515c]
signal system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l333_c12_515c_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l333_c12_515c_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l333_c12_515c_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l335_c11_ff70]
signal BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c1_347e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l338_c1_d12f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l335_c7_5705]
signal result_MUX_uxn_device_h_l335_c7_5705_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l335_c7_5705_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l335_c7_5705_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l335_c7_5705_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l336_c12_17ce]
signal screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l336_c12_17ce_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l336_c12_17ce_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l336_c12_17ce_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l339_c12_e71e]
signal generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l339_c12_e71e_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l339_c12_e71e_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l339_c12_e71e_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l330_c11_7aa8
BIN_OP_AND_uxn_device_h_l330_c11_7aa8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left,
BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right,
BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output);

-- BIN_OP_EQ_uxn_device_h_l332_c6_972a
BIN_OP_EQ_uxn_device_h_l332_c6_972a : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l332_c6_972a_left,
BIN_OP_EQ_uxn_device_h_l332_c6_972a_right,
BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output);

-- result_MUX_uxn_device_h_l332_c2_96fc
result_MUX_uxn_device_h_l332_c2_96fc : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l332_c2_96fc_cond,
result_MUX_uxn_device_h_l332_c2_96fc_iftrue,
result_MUX_uxn_device_h_l332_c2_96fc_iffalse,
result_MUX_uxn_device_h_l332_c2_96fc_return_output);

-- system_dei_uxn_device_h_l333_c12_515c
system_dei_uxn_device_h_l333_c12_515c : entity work.system_dei_0CLK_69d14ba8 port map (
clk,
system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE,
system_dei_uxn_device_h_l333_c12_515c_device_address,
system_dei_uxn_device_h_l333_c12_515c_phase,
system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read,
system_dei_uxn_device_h_l333_c12_515c_return_output);

-- BIN_OP_EQ_uxn_device_h_l335_c11_ff70
BIN_OP_EQ_uxn_device_h_l335_c11_ff70 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left,
BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right,
BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output);

-- result_MUX_uxn_device_h_l335_c7_5705
result_MUX_uxn_device_h_l335_c7_5705 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l335_c7_5705_cond,
result_MUX_uxn_device_h_l335_c7_5705_iftrue,
result_MUX_uxn_device_h_l335_c7_5705_iffalse,
result_MUX_uxn_device_h_l335_c7_5705_return_output);

-- screen_dei_uxn_device_h_l336_c12_17ce
screen_dei_uxn_device_h_l336_c12_17ce : entity work.screen_dei_0CLK_2a3a37a0 port map (
clk,
screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE,
screen_dei_uxn_device_h_l336_c12_17ce_device_address,
screen_dei_uxn_device_h_l336_c12_17ce_phase,
screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read,
screen_dei_uxn_device_h_l336_c12_17ce_return_output);

-- generic_dei_uxn_device_h_l339_c12_e71e
generic_dei_uxn_device_h_l339_c12_e71e : entity work.generic_dei_0CLK_6f2c5aad port map (
clk,
generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE,
generic_dei_uxn_device_h_l339_c12_e71e_device_address,
generic_dei_uxn_device_h_l339_c12_e71e_phase,
generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read,
generic_dei_uxn_device_h_l339_c12_e71e_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output,
 BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output,
 result_MUX_uxn_device_h_l332_c2_96fc_return_output,
 system_dei_uxn_device_h_l333_c12_515c_return_output,
 BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output,
 result_MUX_uxn_device_h_l335_c7_5705_return_output,
 screen_dei_uxn_device_h_l336_c12_17ce_return_output,
 generic_dei_uxn_device_h_l339_c12_e71e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l332_c2_96fc_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l332_c2_96fc_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l335_c7_5705_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l332_c2_96fc_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l332_c2_96fc_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l333_c12_515c_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l333_c12_515c_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l333_c12_515c_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l335_c7_5705_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l335_c7_5705_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l335_c7_5705_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l336_c12_17ce_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l336_c12_17ce_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l336_c12_17ce_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l339_c12_e71e_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l339_c12_e71e_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l339_c12_e71e_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_device : unsigned(7 downto 0);
variable REG_VAR_result : device_in_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_device := device;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l339_c12_e71e_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l336_c12_17ce_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l333_c12_515c_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l339_c12_e71e_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l336_c12_17ce_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l333_c12_515c_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l330_c11_7aa8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left <= VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_left;
     BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right <= VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output := BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_left := VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left := VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l330_c11_7aa8_return_output;
     -- BIN_OP_EQ[uxn_device_h_l335_c11_ff70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left <= VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_left;
     BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right <= VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output := BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output;

     -- BIN_OP_EQ[uxn_device_h_l332_c6_972a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l332_c6_972a_left <= VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_left;
     BIN_OP_EQ_uxn_device_h_l332_c6_972a_right <= VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output := BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond := VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond := VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output;
     VAR_result_MUX_uxn_device_h_l332_c2_96fc_cond := VAR_BIN_OP_EQ_uxn_device_h_l332_c6_972a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond := VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond := VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output;
     VAR_result_MUX_uxn_device_h_l335_c7_5705_cond := VAR_BIN_OP_EQ_uxn_device_h_l335_c11_ff70_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c7_5705] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l332_c1_9dcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c7_5705_return_output;
     VAR_system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l332_c1_9dcd_return_output;
     -- system_dei[uxn_device_h_l333_c12_515c] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l333_c12_515c_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l333_c12_515c_device_address <= VAR_system_dei_uxn_device_h_l333_c12_515c_device_address;
     system_dei_uxn_device_h_l333_c12_515c_phase <= VAR_system_dei_uxn_device_h_l333_c12_515c_phase;
     system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l333_c12_515c_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l333_c12_515c_return_output := system_dei_uxn_device_h_l333_c12_515c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l335_c1_347e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l338_c1_d12f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output;

     -- Submodule level 4
     VAR_generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l338_c1_d12f_return_output;
     VAR_screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l335_c1_347e_return_output;
     VAR_result_MUX_uxn_device_h_l332_c2_96fc_iftrue := VAR_system_dei_uxn_device_h_l333_c12_515c_return_output;
     -- screen_dei[uxn_device_h_l336_c12_17ce] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l336_c12_17ce_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l336_c12_17ce_device_address <= VAR_screen_dei_uxn_device_h_l336_c12_17ce_device_address;
     screen_dei_uxn_device_h_l336_c12_17ce_phase <= VAR_screen_dei_uxn_device_h_l336_c12_17ce_phase;
     screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l336_c12_17ce_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l336_c12_17ce_return_output := screen_dei_uxn_device_h_l336_c12_17ce_return_output;

     -- generic_dei[uxn_device_h_l339_c12_e71e] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l339_c12_e71e_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l339_c12_e71e_device_address <= VAR_generic_dei_uxn_device_h_l339_c12_e71e_device_address;
     generic_dei_uxn_device_h_l339_c12_e71e_phase <= VAR_generic_dei_uxn_device_h_l339_c12_e71e_phase;
     generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l339_c12_e71e_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l339_c12_e71e_return_output := generic_dei_uxn_device_h_l339_c12_e71e_return_output;

     -- Submodule level 5
     VAR_result_MUX_uxn_device_h_l335_c7_5705_iffalse := VAR_generic_dei_uxn_device_h_l339_c12_e71e_return_output;
     VAR_result_MUX_uxn_device_h_l335_c7_5705_iftrue := VAR_screen_dei_uxn_device_h_l336_c12_17ce_return_output;
     -- result_MUX[uxn_device_h_l335_c7_5705] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l335_c7_5705_cond <= VAR_result_MUX_uxn_device_h_l335_c7_5705_cond;
     result_MUX_uxn_device_h_l335_c7_5705_iftrue <= VAR_result_MUX_uxn_device_h_l335_c7_5705_iftrue;
     result_MUX_uxn_device_h_l335_c7_5705_iffalse <= VAR_result_MUX_uxn_device_h_l335_c7_5705_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l335_c7_5705_return_output := result_MUX_uxn_device_h_l335_c7_5705_return_output;

     -- Submodule level 6
     VAR_result_MUX_uxn_device_h_l332_c2_96fc_iffalse := VAR_result_MUX_uxn_device_h_l335_c7_5705_return_output;
     -- result_MUX[uxn_device_h_l332_c2_96fc] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l332_c2_96fc_cond <= VAR_result_MUX_uxn_device_h_l332_c2_96fc_cond;
     result_MUX_uxn_device_h_l332_c2_96fc_iftrue <= VAR_result_MUX_uxn_device_h_l332_c2_96fc_iftrue;
     result_MUX_uxn_device_h_l332_c2_96fc_iffalse <= VAR_result_MUX_uxn_device_h_l332_c2_96fc_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l332_c2_96fc_return_output := result_MUX_uxn_device_h_l332_c2_96fc_return_output;

     -- Submodule level 7
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l332_c2_96fc_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l332_c2_96fc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_device <= REG_VAR_device;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     device <= REG_COMB_device;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
