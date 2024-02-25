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
-- Submodules: 22
entity device_in_0CLK_1cf980b6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 controller0_buttons : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end device_in_0CLK_1cf980b6;
architecture arch of device_in_0CLK_1cf980b6 is
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
-- BIN_OP_AND[uxn_device_h_l568_c11_b366]
signal BIN_OP_AND_uxn_device_h_l568_c11_b366_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l568_c11_b366_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l570_c6_784e]
signal BIN_OP_EQ_uxn_device_h_l570_c6_784e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c6_784e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c1_d6a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c7_9499]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l570_c2_6491]
signal result_MUX_uxn_device_h_l570_c2_6491_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l570_c2_6491_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c2_6491_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c2_6491_return_output : device_in_result_t;

-- system_dei[uxn_device_h_l571_c12_b388]
signal system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE : unsigned(0 downto 0);
signal system_dei_uxn_device_h_l571_c12_b388_device_address : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l571_c12_b388_phase : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read : unsigned(7 downto 0);
signal system_dei_uxn_device_h_l571_c12_b388_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l573_c11_781d]
signal BIN_OP_EQ_uxn_device_h_l573_c11_781d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l573_c11_781d_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c1_1aa0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c7_aa78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l573_c7_9499]
signal result_MUX_uxn_device_h_l573_c7_9499_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l573_c7_9499_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l573_c7_9499_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l573_c7_9499_return_output : device_in_result_t;

-- screen_dei[uxn_device_h_l574_c12_c5e4]
signal screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE : unsigned(0 downto 0);
signal screen_dei_uxn_device_h_l574_c12_c5e4_device_address : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l574_c12_c5e4_phase : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read : unsigned(7 downto 0);
signal screen_dei_uxn_device_h_l574_c12_c5e4_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l576_c11_bc9e]
signal BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c1_fa68]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l579_c7_16b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l576_c7_aa78]
signal result_MUX_uxn_device_h_l576_c7_aa78_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l576_c7_aa78_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l576_c7_aa78_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l576_c7_aa78_return_output : device_in_result_t;

-- controller_dei[uxn_device_h_l577_c12_4b12]
signal controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE : unsigned(0 downto 0);
signal controller_dei_uxn_device_h_l577_c12_4b12_device_address : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l577_c12_4b12_phase : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read : unsigned(7 downto 0);
signal controller_dei_uxn_device_h_l577_c12_4b12_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l579_c11_d394]
signal BIN_OP_EQ_uxn_device_h_l579_c11_d394_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l579_c11_d394_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l579_c1_e62b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l582_c1_702c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l579_c7_16b9]
signal result_MUX_uxn_device_h_l579_c7_16b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l579_c7_16b9_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l579_c7_16b9_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l579_c7_16b9_return_output : device_in_result_t;

-- datetime_dei[uxn_device_h_l580_c12_4d55]
signal datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE : unsigned(0 downto 0);
signal datetime_dei_uxn_device_h_l580_c12_4d55_device_address : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l580_c12_4d55_phase : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read : unsigned(7 downto 0);
signal datetime_dei_uxn_device_h_l580_c12_4d55_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l583_c12_c5dc]
signal generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l583_c12_c5dc_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l583_c12_c5dc_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l583_c12_c5dc_return_output : device_in_result_t;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_AND_uxn_device_h_l568_c11_b366
BIN_OP_AND_uxn_device_h_l568_c11_b366 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l568_c11_b366_left,
BIN_OP_AND_uxn_device_h_l568_c11_b366_right,
BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output);

-- BIN_OP_EQ_uxn_device_h_l570_c6_784e
BIN_OP_EQ_uxn_device_h_l570_c6_784e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l570_c6_784e_left,
BIN_OP_EQ_uxn_device_h_l570_c6_784e_right,
BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output);

-- result_MUX_uxn_device_h_l570_c2_6491
result_MUX_uxn_device_h_l570_c2_6491 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l570_c2_6491_cond,
result_MUX_uxn_device_h_l570_c2_6491_iftrue,
result_MUX_uxn_device_h_l570_c2_6491_iffalse,
result_MUX_uxn_device_h_l570_c2_6491_return_output);

-- system_dei_uxn_device_h_l571_c12_b388
system_dei_uxn_device_h_l571_c12_b388 : entity work.system_dei_0CLK_5e0132c5 port map (
clk,
system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE,
system_dei_uxn_device_h_l571_c12_b388_device_address,
system_dei_uxn_device_h_l571_c12_b388_phase,
system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read,
system_dei_uxn_device_h_l571_c12_b388_return_output);

-- BIN_OP_EQ_uxn_device_h_l573_c11_781d
BIN_OP_EQ_uxn_device_h_l573_c11_781d : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l573_c11_781d_left,
BIN_OP_EQ_uxn_device_h_l573_c11_781d_right,
BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output);

-- result_MUX_uxn_device_h_l573_c7_9499
result_MUX_uxn_device_h_l573_c7_9499 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l573_c7_9499_cond,
result_MUX_uxn_device_h_l573_c7_9499_iftrue,
result_MUX_uxn_device_h_l573_c7_9499_iffalse,
result_MUX_uxn_device_h_l573_c7_9499_return_output);

-- screen_dei_uxn_device_h_l574_c12_c5e4
screen_dei_uxn_device_h_l574_c12_c5e4 : entity work.screen_dei_0CLK_d7085478 port map (
clk,
screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE,
screen_dei_uxn_device_h_l574_c12_c5e4_device_address,
screen_dei_uxn_device_h_l574_c12_c5e4_phase,
screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read,
screen_dei_uxn_device_h_l574_c12_c5e4_return_output);

-- BIN_OP_EQ_uxn_device_h_l576_c11_bc9e
BIN_OP_EQ_uxn_device_h_l576_c11_bc9e : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left,
BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right,
BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output);

-- result_MUX_uxn_device_h_l576_c7_aa78
result_MUX_uxn_device_h_l576_c7_aa78 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l576_c7_aa78_cond,
result_MUX_uxn_device_h_l576_c7_aa78_iftrue,
result_MUX_uxn_device_h_l576_c7_aa78_iffalse,
result_MUX_uxn_device_h_l576_c7_aa78_return_output);

-- controller_dei_uxn_device_h_l577_c12_4b12
controller_dei_uxn_device_h_l577_c12_4b12 : entity work.controller_dei_0CLK_b6e68f82 port map (
clk,
controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE,
controller_dei_uxn_device_h_l577_c12_4b12_device_address,
controller_dei_uxn_device_h_l577_c12_4b12_phase,
controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons,
controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read,
controller_dei_uxn_device_h_l577_c12_4b12_return_output);

-- BIN_OP_EQ_uxn_device_h_l579_c11_d394
BIN_OP_EQ_uxn_device_h_l579_c11_d394 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l579_c11_d394_left,
BIN_OP_EQ_uxn_device_h_l579_c11_d394_right,
BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output);

-- result_MUX_uxn_device_h_l579_c7_16b9
result_MUX_uxn_device_h_l579_c7_16b9 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l579_c7_16b9_cond,
result_MUX_uxn_device_h_l579_c7_16b9_iftrue,
result_MUX_uxn_device_h_l579_c7_16b9_iffalse,
result_MUX_uxn_device_h_l579_c7_16b9_return_output);

-- datetime_dei_uxn_device_h_l580_c12_4d55
datetime_dei_uxn_device_h_l580_c12_4d55 : entity work.datetime_dei_0CLK_24541ec2 port map (
clk,
datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE,
datetime_dei_uxn_device_h_l580_c12_4d55_device_address,
datetime_dei_uxn_device_h_l580_c12_4d55_phase,
datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read,
datetime_dei_uxn_device_h_l580_c12_4d55_return_output);

-- generic_dei_uxn_device_h_l583_c12_c5dc
generic_dei_uxn_device_h_l583_c12_c5dc : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE,
generic_dei_uxn_device_h_l583_c12_c5dc_device_address,
generic_dei_uxn_device_h_l583_c12_c5dc_phase,
generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read,
generic_dei_uxn_device_h_l583_c12_c5dc_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 controller0_buttons,
 previous_device_ram_read,
 -- Registers
 device,
 result,
 -- All submodule outputs
 BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output,
 BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output,
 result_MUX_uxn_device_h_l570_c2_6491_return_output,
 system_dei_uxn_device_h_l571_c12_b388_return_output,
 BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output,
 result_MUX_uxn_device_h_l573_c7_9499_return_output,
 screen_dei_uxn_device_h_l574_c12_c5e4_return_output,
 BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output,
 result_MUX_uxn_device_h_l576_c7_aa78_return_output,
 controller_dei_uxn_device_h_l577_c12_4b12_return_output,
 BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output,
 result_MUX_uxn_device_h_l579_c7_16b9_return_output,
 datetime_dei_uxn_device_h_l580_c12_4d55_return_output,
 generic_dei_uxn_device_h_l583_c12_c5dc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_controller0_buttons : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l570_c2_6491_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c2_6491_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_9499_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c2_6491_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c2_6491_cond : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l571_c12_b388_device_address : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l571_c12_b388_phase : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_system_dei_uxn_device_h_l571_c12_b388_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l573_c7_9499_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_9499_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_aa78_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l573_c7_9499_cond : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l574_c12_c5e4_device_address : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l574_c12_c5e4_phase : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_screen_dei_uxn_device_h_l574_c12_c5e4_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l576_c7_aa78_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_aa78_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l579_c7_16b9_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l576_c7_aa78_cond : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_device_address : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_phase : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_controller_dei_uxn_device_h_l577_c12_4b12_return_output : device_in_result_t;
 variable VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l579_c7_16b9_iftrue : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l579_c7_16b9_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l579_c7_16b9_cond : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l580_c12_4d55_device_address : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l580_c12_4d55_phase : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_datetime_dei_uxn_device_h_l580_c12_4d55_return_output : device_in_result_t;
 variable VAR_generic_dei_uxn_device_h_l583_c12_c5dc_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l583_c12_c5dc_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l583_c12_c5dc_return_output : device_in_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_right := to_unsigned(32, 8);
     VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_right := to_unsigned(240, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_right := to_unsigned(0, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_right := to_unsigned(192, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right := to_unsigned(128, 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_address := device_address;
     VAR_phase := phase;
     VAR_controller0_buttons := controller0_buttons;
     VAR_previous_device_ram_read := previous_device_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue := VAR_CLOCK_ENABLE;
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons := VAR_controller0_buttons;
     VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_left := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_device_address := VAR_device_address;
     VAR_datetime_dei_uxn_device_h_l580_c12_4d55_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l583_c12_c5dc_device_address := VAR_device_address;
     VAR_screen_dei_uxn_device_h_l574_c12_c5e4_device_address := VAR_device_address;
     VAR_system_dei_uxn_device_h_l571_c12_b388_device_address := VAR_device_address;
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_phase := VAR_phase;
     VAR_datetime_dei_uxn_device_h_l580_c12_4d55_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l583_c12_c5dc_phase := VAR_phase;
     VAR_screen_dei_uxn_device_h_l574_c12_c5e4_phase := VAR_phase;
     VAR_system_dei_uxn_device_h_l571_c12_b388_phase := VAR_phase;
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read := VAR_previous_device_ram_read;
     -- BIN_OP_AND[uxn_device_h_l568_c11_b366] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l568_c11_b366_left <= VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_left;
     BIN_OP_AND_uxn_device_h_l568_c11_b366_right <= VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output := BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_left := VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_left := VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left := VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_left := VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;
     REG_VAR_device := VAR_BIN_OP_AND_uxn_device_h_l568_c11_b366_return_output;
     -- BIN_OP_EQ[uxn_device_h_l579_c11_d394] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l579_c11_d394_left <= VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_left;
     BIN_OP_EQ_uxn_device_h_l579_c11_d394_right <= VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output := BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output;

     -- BIN_OP_EQ[uxn_device_h_l573_c11_781d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l573_c11_781d_left <= VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_left;
     BIN_OP_EQ_uxn_device_h_l573_c11_781d_right <= VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output := BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l570_c6_784e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l570_c6_784e_left <= VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_left;
     BIN_OP_EQ_uxn_device_h_l570_c6_784e_right <= VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output := BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l576_c11_bc9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left <= VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_left;
     BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right <= VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output := BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output;
     VAR_result_MUX_uxn_device_h_l570_c2_6491_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c6_784e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond := VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output;
     VAR_result_MUX_uxn_device_h_l573_c7_9499_cond := VAR_BIN_OP_EQ_uxn_device_h_l573_c11_781d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond := VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output;
     VAR_result_MUX_uxn_device_h_l576_c7_aa78_cond := VAR_BIN_OP_EQ_uxn_device_h_l576_c11_bc9e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond := VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond := VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output;
     VAR_result_MUX_uxn_device_h_l579_c7_16b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l579_c11_d394_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c1_d6a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c7_9499] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c7_9499_return_output;
     VAR_system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c1_d6a0_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c7_aa78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l573_c1_1aa0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output;

     -- system_dei[uxn_device_h_l571_c12_b388] LATENCY=0
     -- Clock enable
     system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE <= VAR_system_dei_uxn_device_h_l571_c12_b388_CLOCK_ENABLE;
     -- Inputs
     system_dei_uxn_device_h_l571_c12_b388_device_address <= VAR_system_dei_uxn_device_h_l571_c12_b388_device_address;
     system_dei_uxn_device_h_l571_c12_b388_phase <= VAR_system_dei_uxn_device_h_l571_c12_b388_phase;
     system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read <= VAR_system_dei_uxn_device_h_l571_c12_b388_previous_device_ram_read;
     -- Outputs
     VAR_system_dei_uxn_device_h_l571_c12_b388_return_output := system_dei_uxn_device_h_l571_c12_b388_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c7_aa78_return_output;
     VAR_screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l573_c1_1aa0_return_output;
     VAR_result_MUX_uxn_device_h_l570_c2_6491_iftrue := VAR_system_dei_uxn_device_h_l571_c12_b388_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l579_c7_16b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output;

     -- screen_dei[uxn_device_h_l574_c12_c5e4] LATENCY=0
     -- Clock enable
     screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE <= VAR_screen_dei_uxn_device_h_l574_c12_c5e4_CLOCK_ENABLE;
     -- Inputs
     screen_dei_uxn_device_h_l574_c12_c5e4_device_address <= VAR_screen_dei_uxn_device_h_l574_c12_c5e4_device_address;
     screen_dei_uxn_device_h_l574_c12_c5e4_phase <= VAR_screen_dei_uxn_device_h_l574_c12_c5e4_phase;
     screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read <= VAR_screen_dei_uxn_device_h_l574_c12_c5e4_previous_device_ram_read;
     -- Outputs
     VAR_screen_dei_uxn_device_h_l574_c12_c5e4_return_output := screen_dei_uxn_device_h_l574_c12_c5e4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l576_c1_fa68] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c7_16b9_return_output;
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l576_c1_fa68_return_output;
     VAR_result_MUX_uxn_device_h_l573_c7_9499_iftrue := VAR_screen_dei_uxn_device_h_l574_c12_c5e4_return_output;
     -- controller_dei[uxn_device_h_l577_c12_4b12] LATENCY=0
     -- Clock enable
     controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE <= VAR_controller_dei_uxn_device_h_l577_c12_4b12_CLOCK_ENABLE;
     -- Inputs
     controller_dei_uxn_device_h_l577_c12_4b12_device_address <= VAR_controller_dei_uxn_device_h_l577_c12_4b12_device_address;
     controller_dei_uxn_device_h_l577_c12_4b12_phase <= VAR_controller_dei_uxn_device_h_l577_c12_4b12_phase;
     controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons <= VAR_controller_dei_uxn_device_h_l577_c12_4b12_controller0_buttons;
     controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read <= VAR_controller_dei_uxn_device_h_l577_c12_4b12_previous_device_ram_read;
     -- Outputs
     VAR_controller_dei_uxn_device_h_l577_c12_4b12_return_output := controller_dei_uxn_device_h_l577_c12_4b12_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l579_c1_e62b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l582_c1_702c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output;

     -- Submodule level 6
     VAR_generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l582_c1_702c_return_output;
     VAR_datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l579_c1_e62b_return_output;
     VAR_result_MUX_uxn_device_h_l576_c7_aa78_iftrue := VAR_controller_dei_uxn_device_h_l577_c12_4b12_return_output;
     -- datetime_dei[uxn_device_h_l580_c12_4d55] LATENCY=0
     -- Clock enable
     datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE <= VAR_datetime_dei_uxn_device_h_l580_c12_4d55_CLOCK_ENABLE;
     -- Inputs
     datetime_dei_uxn_device_h_l580_c12_4d55_device_address <= VAR_datetime_dei_uxn_device_h_l580_c12_4d55_device_address;
     datetime_dei_uxn_device_h_l580_c12_4d55_phase <= VAR_datetime_dei_uxn_device_h_l580_c12_4d55_phase;
     datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read <= VAR_datetime_dei_uxn_device_h_l580_c12_4d55_previous_device_ram_read;
     -- Outputs
     VAR_datetime_dei_uxn_device_h_l580_c12_4d55_return_output := datetime_dei_uxn_device_h_l580_c12_4d55_return_output;

     -- generic_dei[uxn_device_h_l583_c12_c5dc] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l583_c12_c5dc_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l583_c12_c5dc_device_address <= VAR_generic_dei_uxn_device_h_l583_c12_c5dc_device_address;
     generic_dei_uxn_device_h_l583_c12_c5dc_phase <= VAR_generic_dei_uxn_device_h_l583_c12_c5dc_phase;
     generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l583_c12_c5dc_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l583_c12_c5dc_return_output := generic_dei_uxn_device_h_l583_c12_c5dc_return_output;

     -- Submodule level 7
     VAR_result_MUX_uxn_device_h_l579_c7_16b9_iftrue := VAR_datetime_dei_uxn_device_h_l580_c12_4d55_return_output;
     VAR_result_MUX_uxn_device_h_l579_c7_16b9_iffalse := VAR_generic_dei_uxn_device_h_l583_c12_c5dc_return_output;
     -- result_MUX[uxn_device_h_l579_c7_16b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l579_c7_16b9_cond <= VAR_result_MUX_uxn_device_h_l579_c7_16b9_cond;
     result_MUX_uxn_device_h_l579_c7_16b9_iftrue <= VAR_result_MUX_uxn_device_h_l579_c7_16b9_iftrue;
     result_MUX_uxn_device_h_l579_c7_16b9_iffalse <= VAR_result_MUX_uxn_device_h_l579_c7_16b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l579_c7_16b9_return_output := result_MUX_uxn_device_h_l579_c7_16b9_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l576_c7_aa78_iffalse := VAR_result_MUX_uxn_device_h_l579_c7_16b9_return_output;
     -- result_MUX[uxn_device_h_l576_c7_aa78] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l576_c7_aa78_cond <= VAR_result_MUX_uxn_device_h_l576_c7_aa78_cond;
     result_MUX_uxn_device_h_l576_c7_aa78_iftrue <= VAR_result_MUX_uxn_device_h_l576_c7_aa78_iftrue;
     result_MUX_uxn_device_h_l576_c7_aa78_iffalse <= VAR_result_MUX_uxn_device_h_l576_c7_aa78_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l576_c7_aa78_return_output := result_MUX_uxn_device_h_l576_c7_aa78_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l573_c7_9499_iffalse := VAR_result_MUX_uxn_device_h_l576_c7_aa78_return_output;
     -- result_MUX[uxn_device_h_l573_c7_9499] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l573_c7_9499_cond <= VAR_result_MUX_uxn_device_h_l573_c7_9499_cond;
     result_MUX_uxn_device_h_l573_c7_9499_iftrue <= VAR_result_MUX_uxn_device_h_l573_c7_9499_iftrue;
     result_MUX_uxn_device_h_l573_c7_9499_iffalse <= VAR_result_MUX_uxn_device_h_l573_c7_9499_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l573_c7_9499_return_output := result_MUX_uxn_device_h_l573_c7_9499_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l570_c2_6491_iffalse := VAR_result_MUX_uxn_device_h_l573_c7_9499_return_output;
     -- result_MUX[uxn_device_h_l570_c2_6491] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l570_c2_6491_cond <= VAR_result_MUX_uxn_device_h_l570_c2_6491_cond;
     result_MUX_uxn_device_h_l570_c2_6491_iftrue <= VAR_result_MUX_uxn_device_h_l570_c2_6491_iftrue;
     result_MUX_uxn_device_h_l570_c2_6491_iffalse <= VAR_result_MUX_uxn_device_h_l570_c2_6491_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l570_c2_6491_return_output := result_MUX_uxn_device_h_l570_c2_6491_return_output;

     -- Submodule level 11
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l570_c2_6491_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l570_c2_6491_return_output;
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
