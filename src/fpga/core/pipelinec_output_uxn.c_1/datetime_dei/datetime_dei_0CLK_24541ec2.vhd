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
-- Submodules: 46
entity datetime_dei_0CLK_24541ec2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_address : in unsigned(7 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_in_result_t);
end datetime_dei_0CLK_24541ec2;
architecture arch of datetime_dei_0CLK_24541ec2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : device_in_result_t := (
device_ram_address => to_unsigned(0, 8),
dei_value => to_unsigned(0, 8),
is_dei_done => to_unsigned(0, 1))
;
signal device_port : unsigned(3 downto 0) := to_unsigned(0, 4);
signal REG_COMB_result : device_in_result_t;
signal REG_COMB_device_port : unsigned(3 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l540_c6_a0e0]
signal BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l545_c7_cc8a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l540_c2_b7cf]
signal result_MUX_uxn_device_h_l540_c2_b7cf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l540_c2_b7cf_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l540_c2_b7cf_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l540_c2_b7cf_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l545_c11_9407]
signal BIN_OP_EQ_uxn_device_h_l545_c11_9407_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l545_c11_9407_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l550_c7_c89f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l545_c7_cc8a]
signal result_MUX_uxn_device_h_l545_c7_cc8a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l545_c7_cc8a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l545_c7_cc8a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l545_c7_cc8a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l550_c11_50c9]
signal BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l555_c7_be05]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l550_c7_c89f]
signal result_MUX_uxn_device_h_l550_c7_c89f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l550_c7_c89f_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l550_c7_c89f_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l550_c7_c89f_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l555_c11_e80f]
signal BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l560_c7_090a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l555_c7_be05]
signal result_MUX_uxn_device_h_l555_c7_be05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l555_c7_be05_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l555_c7_be05_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l555_c7_be05_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l560_c11_214c]
signal BIN_OP_EQ_uxn_device_h_l560_c11_214c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l560_c11_214c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l565_c7_fbb1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l560_c7_090a]
signal result_MUX_uxn_device_h_l560_c7_090a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l560_c7_090a_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l560_c7_090a_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l560_c7_090a_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l565_c11_0b44]
signal BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c7_6361]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l565_c7_fbb1]
signal result_MUX_uxn_device_h_l565_c7_fbb1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l565_c7_fbb1_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l565_c7_fbb1_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l565_c7_fbb1_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l570_c11_17c2]
signal BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l575_c7_2e94]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l570_c7_6361]
signal result_MUX_uxn_device_h_l570_c7_6361_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l570_c7_6361_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c7_6361_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l570_c7_6361_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l575_c11_c9a1]
signal BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l580_c7_3de1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l575_c7_2e94]
signal result_MUX_uxn_device_h_l575_c7_2e94_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l575_c7_2e94_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l575_c7_2e94_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l575_c7_2e94_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l580_c11_06b3]
signal BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l585_c7_8e34]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l580_c7_3de1]
signal result_MUX_uxn_device_h_l580_c7_3de1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l580_c7_3de1_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l580_c7_3de1_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l580_c7_3de1_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l585_c11_49ce]
signal BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l590_c7_45e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l585_c7_8e34]
signal result_MUX_uxn_device_h_l585_c7_8e34_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l585_c7_8e34_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l585_c7_8e34_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l585_c7_8e34_return_output : device_in_result_t;

-- BIN_OP_EQ[uxn_device_h_l590_c11_073f]
signal BIN_OP_EQ_uxn_device_h_l590_c11_073f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l590_c11_073f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l595_c1_a867]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l590_c7_45e8]
signal result_MUX_uxn_device_h_l590_c7_45e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l590_c7_45e8_iftrue : device_in_result_t;
signal result_MUX_uxn_device_h_l590_c7_45e8_iffalse : device_in_result_t;
signal result_MUX_uxn_device_h_l590_c7_45e8_return_output : device_in_result_t;

-- generic_dei[uxn_device_h_l596_c12_ba47]
signal generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE : unsigned(0 downto 0);
signal generic_dei_uxn_device_h_l596_c12_ba47_device_address : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_ba47_phase : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read : unsigned(7 downto 0);
signal generic_dei_uxn_device_h_l596_c12_ba47_return_output : device_in_result_t;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_in_result_t_device_in_result_t_5662( ref_toks_0 : unsigned;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned) return device_in_result_t is
 
  variable base : device_in_result_t; 
  variable return_output : device_in_result_t;
begin
      base.device_ram_address := ref_toks_0;
      base.dei_value := ref_toks_1;
      base.is_dei_done := ref_toks_2;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l540_c6_a0e0
BIN_OP_EQ_uxn_device_h_l540_c6_a0e0 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left,
BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right,
BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output);

-- result_MUX_uxn_device_h_l540_c2_b7cf
result_MUX_uxn_device_h_l540_c2_b7cf : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l540_c2_b7cf_cond,
result_MUX_uxn_device_h_l540_c2_b7cf_iftrue,
result_MUX_uxn_device_h_l540_c2_b7cf_iffalse,
result_MUX_uxn_device_h_l540_c2_b7cf_return_output);

-- BIN_OP_EQ_uxn_device_h_l545_c11_9407
BIN_OP_EQ_uxn_device_h_l545_c11_9407 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l545_c11_9407_left,
BIN_OP_EQ_uxn_device_h_l545_c11_9407_right,
BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output);

-- result_MUX_uxn_device_h_l545_c7_cc8a
result_MUX_uxn_device_h_l545_c7_cc8a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l545_c7_cc8a_cond,
result_MUX_uxn_device_h_l545_c7_cc8a_iftrue,
result_MUX_uxn_device_h_l545_c7_cc8a_iffalse,
result_MUX_uxn_device_h_l545_c7_cc8a_return_output);

-- BIN_OP_EQ_uxn_device_h_l550_c11_50c9
BIN_OP_EQ_uxn_device_h_l550_c11_50c9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left,
BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right,
BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output);

-- result_MUX_uxn_device_h_l550_c7_c89f
result_MUX_uxn_device_h_l550_c7_c89f : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l550_c7_c89f_cond,
result_MUX_uxn_device_h_l550_c7_c89f_iftrue,
result_MUX_uxn_device_h_l550_c7_c89f_iffalse,
result_MUX_uxn_device_h_l550_c7_c89f_return_output);

-- BIN_OP_EQ_uxn_device_h_l555_c11_e80f
BIN_OP_EQ_uxn_device_h_l555_c11_e80f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left,
BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right,
BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output);

-- result_MUX_uxn_device_h_l555_c7_be05
result_MUX_uxn_device_h_l555_c7_be05 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l555_c7_be05_cond,
result_MUX_uxn_device_h_l555_c7_be05_iftrue,
result_MUX_uxn_device_h_l555_c7_be05_iffalse,
result_MUX_uxn_device_h_l555_c7_be05_return_output);

-- BIN_OP_EQ_uxn_device_h_l560_c11_214c
BIN_OP_EQ_uxn_device_h_l560_c11_214c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l560_c11_214c_left,
BIN_OP_EQ_uxn_device_h_l560_c11_214c_right,
BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output);

-- result_MUX_uxn_device_h_l560_c7_090a
result_MUX_uxn_device_h_l560_c7_090a : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l560_c7_090a_cond,
result_MUX_uxn_device_h_l560_c7_090a_iftrue,
result_MUX_uxn_device_h_l560_c7_090a_iffalse,
result_MUX_uxn_device_h_l560_c7_090a_return_output);

-- BIN_OP_EQ_uxn_device_h_l565_c11_0b44
BIN_OP_EQ_uxn_device_h_l565_c11_0b44 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left,
BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right,
BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output);

-- result_MUX_uxn_device_h_l565_c7_fbb1
result_MUX_uxn_device_h_l565_c7_fbb1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l565_c7_fbb1_cond,
result_MUX_uxn_device_h_l565_c7_fbb1_iftrue,
result_MUX_uxn_device_h_l565_c7_fbb1_iffalse,
result_MUX_uxn_device_h_l565_c7_fbb1_return_output);

-- BIN_OP_EQ_uxn_device_h_l570_c11_17c2
BIN_OP_EQ_uxn_device_h_l570_c11_17c2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left,
BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right,
BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output);

-- result_MUX_uxn_device_h_l570_c7_6361
result_MUX_uxn_device_h_l570_c7_6361 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l570_c7_6361_cond,
result_MUX_uxn_device_h_l570_c7_6361_iftrue,
result_MUX_uxn_device_h_l570_c7_6361_iffalse,
result_MUX_uxn_device_h_l570_c7_6361_return_output);

-- BIN_OP_EQ_uxn_device_h_l575_c11_c9a1
BIN_OP_EQ_uxn_device_h_l575_c11_c9a1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left,
BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right,
BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output);

-- result_MUX_uxn_device_h_l575_c7_2e94
result_MUX_uxn_device_h_l575_c7_2e94 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l575_c7_2e94_cond,
result_MUX_uxn_device_h_l575_c7_2e94_iftrue,
result_MUX_uxn_device_h_l575_c7_2e94_iffalse,
result_MUX_uxn_device_h_l575_c7_2e94_return_output);

-- BIN_OP_EQ_uxn_device_h_l580_c11_06b3
BIN_OP_EQ_uxn_device_h_l580_c11_06b3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left,
BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right,
BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output);

-- result_MUX_uxn_device_h_l580_c7_3de1
result_MUX_uxn_device_h_l580_c7_3de1 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l580_c7_3de1_cond,
result_MUX_uxn_device_h_l580_c7_3de1_iftrue,
result_MUX_uxn_device_h_l580_c7_3de1_iffalse,
result_MUX_uxn_device_h_l580_c7_3de1_return_output);

-- BIN_OP_EQ_uxn_device_h_l585_c11_49ce
BIN_OP_EQ_uxn_device_h_l585_c11_49ce : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left,
BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right,
BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output);

-- result_MUX_uxn_device_h_l585_c7_8e34
result_MUX_uxn_device_h_l585_c7_8e34 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l585_c7_8e34_cond,
result_MUX_uxn_device_h_l585_c7_8e34_iftrue,
result_MUX_uxn_device_h_l585_c7_8e34_iffalse,
result_MUX_uxn_device_h_l585_c7_8e34_return_output);

-- BIN_OP_EQ_uxn_device_h_l590_c11_073f
BIN_OP_EQ_uxn_device_h_l590_c11_073f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l590_c11_073f_left,
BIN_OP_EQ_uxn_device_h_l590_c11_073f_right,
BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output);

-- result_MUX_uxn_device_h_l590_c7_45e8
result_MUX_uxn_device_h_l590_c7_45e8 : entity work.MUX_uint1_t_device_in_result_t_device_in_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l590_c7_45e8_cond,
result_MUX_uxn_device_h_l590_c7_45e8_iftrue,
result_MUX_uxn_device_h_l590_c7_45e8_iffalse,
result_MUX_uxn_device_h_l590_c7_45e8_return_output);

-- generic_dei_uxn_device_h_l596_c12_ba47
generic_dei_uxn_device_h_l596_c12_ba47 : entity work.generic_dei_0CLK_25f4cd11 port map (
clk,
generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE,
generic_dei_uxn_device_h_l596_c12_ba47_device_address,
generic_dei_uxn_device_h_l596_c12_ba47_phase,
generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read,
generic_dei_uxn_device_h_l596_c12_ba47_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_address,
 phase,
 previous_device_ram_read,
 -- Registers
 result,
 device_port,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output,
 result_MUX_uxn_device_h_l540_c2_b7cf_return_output,
 BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output,
 result_MUX_uxn_device_h_l545_c7_cc8a_return_output,
 BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output,
 result_MUX_uxn_device_h_l550_c7_c89f_return_output,
 BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output,
 result_MUX_uxn_device_h_l555_c7_be05_return_output,
 BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output,
 result_MUX_uxn_device_h_l560_c7_090a_return_output,
 BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output,
 result_MUX_uxn_device_h_l565_c7_fbb1_return_output,
 BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output,
 result_MUX_uxn_device_h_l570_c7_6361_return_output,
 BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output,
 result_MUX_uxn_device_h_l575_c7_2e94_return_output,
 BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output,
 result_MUX_uxn_device_h_l580_c7_3de1_return_output,
 BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output,
 result_MUX_uxn_device_h_l585_c7_8e34_return_output,
 BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output,
 result_MUX_uxn_device_h_l590_c7_45e8_return_output,
 generic_dei_uxn_device_h_l596_c12_ba47_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_in_result_t;
 variable VAR_device_address : unsigned(7 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_b7cf_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cc8a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_b7cf_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l540_c2_b7cf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l541_c3_5732 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cc8a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_c89f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l545_c7_cc8a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l546_c3_02b9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l550_c7_c89f_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_c89f_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_c89f_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_be05_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l550_c7_c89f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l551_c3_8afb : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l555_c7_be05_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_be05_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_be05_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_090a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l555_c7_be05_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l556_c3_43b9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l560_c7_090a_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_090a_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_090a_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_fbb1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l560_c7_090a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l561_c3_c125 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_fbb1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_6361_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l565_c7_fbb1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l566_c3_b27d : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l570_c7_6361_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_6361_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_6361_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_2e94_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l570_c7_6361_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l571_c3_83aa : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l575_c7_2e94_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_2e94_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_2e94_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_3de1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l575_c7_2e94_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l576_c3_e3c9 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l580_c7_3de1_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_3de1_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_3de1_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_8e34_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l580_c7_3de1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l581_c3_a241 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l585_c7_8e34_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_8e34_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_8e34_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_45e8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l585_c7_8e34_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l586_c3_6791 : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l590_c7_45e8_iftrue : device_in_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_45e8_return_output : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_45e8_iffalse : device_in_result_t;
 variable VAR_result_MUX_uxn_device_h_l590_c7_45e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l591_c3_fcdc : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_ba47_device_address : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_ba47_phase : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_generic_dei_uxn_device_h_l596_c12_ba47_return_output : device_in_result_t;
 -- State registers comb logic variables
variable REG_VAR_result : device_in_result_t;
variable REG_VAR_device_port : unsigned(3 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_device_port := device_port;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_device_ram_address_uxn_device_h_l556_c3_43b9 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l566_c3_b27d := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right := to_unsigned(0, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l546_c3_02b9 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l576_c3_e3c9 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right := to_unsigned(3, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l571_c3_83aa := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_right := to_unsigned(1, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l586_c3_6791 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right := to_unsigned(7, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right := to_unsigned(2, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l551_c3_8afb := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l541_c3_5732 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_uxn_device_h_l561_c3_c125 := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l591_c3_fcdc := resize(to_unsigned(0, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_right := to_unsigned(4, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_right := to_unsigned(10, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right := to_unsigned(6, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l581_c3_a241 := resize(to_unsigned(0, 1), 8);
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l555_c7_be05] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_be05_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l556_c3_43b9,
     to_unsigned(30, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l585_c7_8e34] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_8e34_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l586_c3_6791,
     to_unsigned(108, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l580_c7_3de1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_3de1_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l581_c3_a241,
     to_unsigned(1, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l575_c7_2e94] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_2e94_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l576_c3_e3c9,
     to_unsigned(5, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l590_c7_45e8] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_45e8_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l591_c3_fcdc,
     to_unsigned(0, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l570_c7_6361] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_6361_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l571_c3_83aa,
     to_unsigned(4, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l565_c7_fbb1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_fbb1_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l566_c3_b27d,
     to_unsigned(51, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l550_c7_c89f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_c89f_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l551_c3_8afb,
     to_unsigned(11, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l545_c7_cc8a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cc8a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l546_c3_02b9,
     to_unsigned(190, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l560_c7_090a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_090a_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l561_c3_c125,
     to_unsigned(6, 8),
     to_unsigned(1, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662[uxn_device_h_l540_c2_b7cf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_b7cf_return_output := CONST_REF_RD_device_in_result_t_device_in_result_t_5662(
     VAR_result_device_ram_address_uxn_device_h_l541_c3_5732,
     to_unsigned(7, 8),
     to_unsigned(1, 1));

     -- Submodule level 1
     VAR_result_MUX_uxn_device_h_l575_c7_2e94_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l575_c7_2e94_return_output;
     VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l545_c7_cc8a_return_output;
     VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l565_c7_fbb1_return_output;
     VAR_result_MUX_uxn_device_h_l560_c7_090a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l560_c7_090a_return_output;
     VAR_result_MUX_uxn_device_h_l555_c7_be05_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l555_c7_be05_return_output;
     VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l540_c2_b7cf_return_output;
     VAR_result_MUX_uxn_device_h_l580_c7_3de1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l580_c7_3de1_return_output;
     VAR_result_MUX_uxn_device_h_l550_c7_c89f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l550_c7_c89f_return_output;
     VAR_result_MUX_uxn_device_h_l570_c7_6361_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l570_c7_6361_return_output;
     VAR_result_MUX_uxn_device_h_l590_c7_45e8_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l590_c7_45e8_return_output;
     VAR_result_MUX_uxn_device_h_l585_c7_8e34_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_in_result_t_device_in_result_t_5662_uxn_device_h_l585_c7_8e34_return_output;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse := VAR_CLOCK_ENABLE;
     VAR_generic_dei_uxn_device_h_l596_c12_ba47_device_address := VAR_device_address;
     VAR_generic_dei_uxn_device_h_l596_c12_ba47_phase := VAR_phase;
     VAR_generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read := VAR_previous_device_ram_read;
     -- CAST_TO_uint4_t[uxn_device_h_l537_c16_c474] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_device_address);

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_left := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     REG_VAR_device_port := VAR_CAST_TO_uint4_t_uxn_device_h_l537_c16_c474_return_output;
     -- BIN_OP_EQ[uxn_device_h_l590_c11_073f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l590_c11_073f_left <= VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_left;
     BIN_OP_EQ_uxn_device_h_l590_c11_073f_right <= VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output := BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l585_c11_49ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left <= VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_left;
     BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right <= VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output := BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output;

     -- BIN_OP_EQ[uxn_device_h_l540_c6_a0e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left <= VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_left;
     BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right <= VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output := BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l575_c11_c9a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left <= VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_left;
     BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right <= VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output := BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l555_c11_e80f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left <= VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_left;
     BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right <= VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output := BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l565_c11_0b44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left <= VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_left;
     BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right <= VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output := BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output;

     -- BIN_OP_EQ[uxn_device_h_l560_c11_214c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l560_c11_214c_left <= VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_left;
     BIN_OP_EQ_uxn_device_h_l560_c11_214c_right <= VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output := BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l545_c11_9407] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l545_c11_9407_left <= VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_left;
     BIN_OP_EQ_uxn_device_h_l545_c11_9407_right <= VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output := BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output;

     -- BIN_OP_EQ[uxn_device_h_l570_c11_17c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_left;
     BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output := BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l580_c11_06b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left <= VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_left;
     BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right <= VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output := BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l550_c11_50c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left <= VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_left;
     BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right <= VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output := BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond := VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output;
     VAR_result_MUX_uxn_device_h_l540_c2_b7cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l540_c6_a0e0_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond := VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output;
     VAR_result_MUX_uxn_device_h_l545_c7_cc8a_cond := VAR_BIN_OP_EQ_uxn_device_h_l545_c11_9407_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond := VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output;
     VAR_result_MUX_uxn_device_h_l550_c7_c89f_cond := VAR_BIN_OP_EQ_uxn_device_h_l550_c11_50c9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond := VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output;
     VAR_result_MUX_uxn_device_h_l555_c7_be05_cond := VAR_BIN_OP_EQ_uxn_device_h_l555_c11_e80f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output;
     VAR_result_MUX_uxn_device_h_l560_c7_090a_cond := VAR_BIN_OP_EQ_uxn_device_h_l560_c11_214c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond := VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output;
     VAR_result_MUX_uxn_device_h_l565_c7_fbb1_cond := VAR_BIN_OP_EQ_uxn_device_h_l565_c11_0b44_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output;
     VAR_result_MUX_uxn_device_h_l570_c7_6361_cond := VAR_BIN_OP_EQ_uxn_device_h_l570_c11_17c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond := VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output;
     VAR_result_MUX_uxn_device_h_l575_c7_2e94_cond := VAR_BIN_OP_EQ_uxn_device_h_l575_c11_c9a1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond := VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output;
     VAR_result_MUX_uxn_device_h_l580_c7_3de1_cond := VAR_BIN_OP_EQ_uxn_device_h_l580_c11_06b3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output;
     VAR_result_MUX_uxn_device_h_l585_c7_8e34_cond := VAR_BIN_OP_EQ_uxn_device_h_l585_c11_49ce_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond := VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output;
     VAR_result_MUX_uxn_device_h_l590_c7_45e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l590_c11_073f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l545_c7_cc8a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l545_c7_cc8a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l550_c7_c89f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l550_c7_c89f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l555_c7_be05] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l555_c7_be05_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l560_c7_090a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l560_c7_090a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l565_c7_fbb1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l565_c7_fbb1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l570_c7_6361] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l570_c7_6361_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l575_c7_2e94] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l575_c7_2e94_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l580_c7_3de1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l580_c7_3de1_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l585_c7_8e34] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l585_c7_8e34_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l590_c7_45e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l590_c7_45e8_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l595_c1_a867] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output;

     -- Submodule level 13
     VAR_generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l595_c1_a867_return_output;
     -- generic_dei[uxn_device_h_l596_c12_ba47] LATENCY=0
     -- Clock enable
     generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE <= VAR_generic_dei_uxn_device_h_l596_c12_ba47_CLOCK_ENABLE;
     -- Inputs
     generic_dei_uxn_device_h_l596_c12_ba47_device_address <= VAR_generic_dei_uxn_device_h_l596_c12_ba47_device_address;
     generic_dei_uxn_device_h_l596_c12_ba47_phase <= VAR_generic_dei_uxn_device_h_l596_c12_ba47_phase;
     generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read <= VAR_generic_dei_uxn_device_h_l596_c12_ba47_previous_device_ram_read;
     -- Outputs
     VAR_generic_dei_uxn_device_h_l596_c12_ba47_return_output := generic_dei_uxn_device_h_l596_c12_ba47_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l590_c7_45e8_iffalse := VAR_generic_dei_uxn_device_h_l596_c12_ba47_return_output;
     -- result_MUX[uxn_device_h_l590_c7_45e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l590_c7_45e8_cond <= VAR_result_MUX_uxn_device_h_l590_c7_45e8_cond;
     result_MUX_uxn_device_h_l590_c7_45e8_iftrue <= VAR_result_MUX_uxn_device_h_l590_c7_45e8_iftrue;
     result_MUX_uxn_device_h_l590_c7_45e8_iffalse <= VAR_result_MUX_uxn_device_h_l590_c7_45e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l590_c7_45e8_return_output := result_MUX_uxn_device_h_l590_c7_45e8_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_device_h_l585_c7_8e34_iffalse := VAR_result_MUX_uxn_device_h_l590_c7_45e8_return_output;
     -- result_MUX[uxn_device_h_l585_c7_8e34] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l585_c7_8e34_cond <= VAR_result_MUX_uxn_device_h_l585_c7_8e34_cond;
     result_MUX_uxn_device_h_l585_c7_8e34_iftrue <= VAR_result_MUX_uxn_device_h_l585_c7_8e34_iftrue;
     result_MUX_uxn_device_h_l585_c7_8e34_iffalse <= VAR_result_MUX_uxn_device_h_l585_c7_8e34_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l585_c7_8e34_return_output := result_MUX_uxn_device_h_l585_c7_8e34_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_device_h_l580_c7_3de1_iffalse := VAR_result_MUX_uxn_device_h_l585_c7_8e34_return_output;
     -- result_MUX[uxn_device_h_l580_c7_3de1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l580_c7_3de1_cond <= VAR_result_MUX_uxn_device_h_l580_c7_3de1_cond;
     result_MUX_uxn_device_h_l580_c7_3de1_iftrue <= VAR_result_MUX_uxn_device_h_l580_c7_3de1_iftrue;
     result_MUX_uxn_device_h_l580_c7_3de1_iffalse <= VAR_result_MUX_uxn_device_h_l580_c7_3de1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l580_c7_3de1_return_output := result_MUX_uxn_device_h_l580_c7_3de1_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_device_h_l575_c7_2e94_iffalse := VAR_result_MUX_uxn_device_h_l580_c7_3de1_return_output;
     -- result_MUX[uxn_device_h_l575_c7_2e94] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l575_c7_2e94_cond <= VAR_result_MUX_uxn_device_h_l575_c7_2e94_cond;
     result_MUX_uxn_device_h_l575_c7_2e94_iftrue <= VAR_result_MUX_uxn_device_h_l575_c7_2e94_iftrue;
     result_MUX_uxn_device_h_l575_c7_2e94_iffalse <= VAR_result_MUX_uxn_device_h_l575_c7_2e94_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l575_c7_2e94_return_output := result_MUX_uxn_device_h_l575_c7_2e94_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_device_h_l570_c7_6361_iffalse := VAR_result_MUX_uxn_device_h_l575_c7_2e94_return_output;
     -- result_MUX[uxn_device_h_l570_c7_6361] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l570_c7_6361_cond <= VAR_result_MUX_uxn_device_h_l570_c7_6361_cond;
     result_MUX_uxn_device_h_l570_c7_6361_iftrue <= VAR_result_MUX_uxn_device_h_l570_c7_6361_iftrue;
     result_MUX_uxn_device_h_l570_c7_6361_iffalse <= VAR_result_MUX_uxn_device_h_l570_c7_6361_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l570_c7_6361_return_output := result_MUX_uxn_device_h_l570_c7_6361_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iffalse := VAR_result_MUX_uxn_device_h_l570_c7_6361_return_output;
     -- result_MUX[uxn_device_h_l565_c7_fbb1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l565_c7_fbb1_cond <= VAR_result_MUX_uxn_device_h_l565_c7_fbb1_cond;
     result_MUX_uxn_device_h_l565_c7_fbb1_iftrue <= VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iftrue;
     result_MUX_uxn_device_h_l565_c7_fbb1_iffalse <= VAR_result_MUX_uxn_device_h_l565_c7_fbb1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l565_c7_fbb1_return_output := result_MUX_uxn_device_h_l565_c7_fbb1_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_device_h_l560_c7_090a_iffalse := VAR_result_MUX_uxn_device_h_l565_c7_fbb1_return_output;
     -- result_MUX[uxn_device_h_l560_c7_090a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l560_c7_090a_cond <= VAR_result_MUX_uxn_device_h_l560_c7_090a_cond;
     result_MUX_uxn_device_h_l560_c7_090a_iftrue <= VAR_result_MUX_uxn_device_h_l560_c7_090a_iftrue;
     result_MUX_uxn_device_h_l560_c7_090a_iffalse <= VAR_result_MUX_uxn_device_h_l560_c7_090a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l560_c7_090a_return_output := result_MUX_uxn_device_h_l560_c7_090a_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_device_h_l555_c7_be05_iffalse := VAR_result_MUX_uxn_device_h_l560_c7_090a_return_output;
     -- result_MUX[uxn_device_h_l555_c7_be05] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l555_c7_be05_cond <= VAR_result_MUX_uxn_device_h_l555_c7_be05_cond;
     result_MUX_uxn_device_h_l555_c7_be05_iftrue <= VAR_result_MUX_uxn_device_h_l555_c7_be05_iftrue;
     result_MUX_uxn_device_h_l555_c7_be05_iffalse <= VAR_result_MUX_uxn_device_h_l555_c7_be05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l555_c7_be05_return_output := result_MUX_uxn_device_h_l555_c7_be05_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_device_h_l550_c7_c89f_iffalse := VAR_result_MUX_uxn_device_h_l555_c7_be05_return_output;
     -- result_MUX[uxn_device_h_l550_c7_c89f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l550_c7_c89f_cond <= VAR_result_MUX_uxn_device_h_l550_c7_c89f_cond;
     result_MUX_uxn_device_h_l550_c7_c89f_iftrue <= VAR_result_MUX_uxn_device_h_l550_c7_c89f_iftrue;
     result_MUX_uxn_device_h_l550_c7_c89f_iffalse <= VAR_result_MUX_uxn_device_h_l550_c7_c89f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l550_c7_c89f_return_output := result_MUX_uxn_device_h_l550_c7_c89f_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iffalse := VAR_result_MUX_uxn_device_h_l550_c7_c89f_return_output;
     -- result_MUX[uxn_device_h_l545_c7_cc8a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l545_c7_cc8a_cond <= VAR_result_MUX_uxn_device_h_l545_c7_cc8a_cond;
     result_MUX_uxn_device_h_l545_c7_cc8a_iftrue <= VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iftrue;
     result_MUX_uxn_device_h_l545_c7_cc8a_iffalse <= VAR_result_MUX_uxn_device_h_l545_c7_cc8a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l545_c7_cc8a_return_output := result_MUX_uxn_device_h_l545_c7_cc8a_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iffalse := VAR_result_MUX_uxn_device_h_l545_c7_cc8a_return_output;
     -- result_MUX[uxn_device_h_l540_c2_b7cf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l540_c2_b7cf_cond <= VAR_result_MUX_uxn_device_h_l540_c2_b7cf_cond;
     result_MUX_uxn_device_h_l540_c2_b7cf_iftrue <= VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iftrue;
     result_MUX_uxn_device_h_l540_c2_b7cf_iffalse <= VAR_result_MUX_uxn_device_h_l540_c2_b7cf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l540_c2_b7cf_return_output := result_MUX_uxn_device_h_l540_c2_b7cf_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l540_c2_b7cf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l540_c2_b7cf_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_port <= REG_VAR_device_port;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     device_port <= REG_COMB_device_port;
 end if;
 end if;
end process;

end arch;
