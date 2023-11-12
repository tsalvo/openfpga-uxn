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
-- Submodules: 67
entity deo_0CLK_0f1297eb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end deo_0CLK_0f1297eb;
architecture arch of deo_0CLK_0f1297eb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal device_out_result : device_out_result_t := device_out_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;
signal REG_COMB_device_out_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l495_c6_fabc]
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_8e37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_4eb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l496_c3_fa1a[uxn_opcodes_h_l496_c3_fa1a]
signal printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l500_c11_ed22]
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_7220]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_8fb0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l503_c11_e5c7]
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_729d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l503_c7_7220]
signal n8_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l503_c7_7220]
signal t8_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l503_c7_7220]
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_7220]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l506_c11_2b14]
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_35b1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l506_c7_729d]
signal n8_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);

-- device_out_result_MUX[uxn_opcodes_h_l506_c7_729d]
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : device_out_result_t;
signal device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output : device_out_result_t;

-- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(15 downto 0);

-- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_729d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l509_c30_793b]
signal sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output : signed(3 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_1da4]
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right : unsigned(2 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output : unsigned(7 downto 0);

-- device_out[uxn_opcodes_h_l513_c23_caf9]
signal device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE : unsigned(0 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_device_address : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_value : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_phase : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read : unsigned(7 downto 0);
signal device_out_uxn_opcodes_h_l513_c23_caf9_return_output : device_out_result_t;

function CONST_REF_RD_opcode_result_t_opcode_result_t_88de( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned;
 ref_toks_11 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.vram_address := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_opc_done := ref_toks_10;
      base.sp_relative_shift := ref_toks_11;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc
BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right,
BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- n8_MUX_uxn_opcodes_h_l495_c2_4eb3
n8_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- t8_MUX_uxn_opcodes_h_l495_c2_4eb3
t8_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3
device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3
result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3
result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3
result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

-- printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a
printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a : entity work.printf_uxn_opcodes_h_l496_c3_fa1a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22
BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right,
BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- n8_MUX_uxn_opcodes_h_l500_c7_8fb0
n8_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- t8_MUX_uxn_opcodes_h_l500_c7_8fb0
t8_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0
device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0
result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0
result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0
result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right,
BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- n8_MUX_uxn_opcodes_h_l503_c7_7220
n8_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l503_c7_7220_cond,
n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- t8_MUX_uxn_opcodes_h_l503_c7_7220
t8_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l503_c7_7220_cond,
t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l503_c7_7220
device_out_result_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond,
device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220
result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220
result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220
result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14
BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right,
BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output);

-- n8_MUX_uxn_opcodes_h_l506_c7_729d
n8_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l506_c7_729d_cond,
n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- device_out_result_MUX_uxn_opcodes_h_l506_c7_729d
device_out_result_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond,
device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d
result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d
result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d
result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l509_c30_793b
sp_relative_shift_uxn_opcodes_h_l509_c30_793b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins,
sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x,
sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y,
sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4 : entity work.BIN_OP_MINUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right,
BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output);

-- device_out_uxn_opcodes_h_l513_c23_caf9
device_out_uxn_opcodes_h_l513_c23_caf9 : entity work.device_out_0CLK_f5486376 port map (
clk,
device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE,
device_out_uxn_opcodes_h_l513_c23_caf9_device_address,
device_out_uxn_opcodes_h_l513_c23_caf9_value,
device_out_uxn_opcodes_h_l513_c23_caf9_phase,
device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read,
device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read,
device_out_uxn_opcodes_h_l513_c23_caf9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 device_out_result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output,
 n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output,
 sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output,
 device_out_uxn_opcodes_h_l513_c23_caf9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_f0e8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_458d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_8fb0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : device_out_result_t;
 variable VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output : signed(3 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_device_address : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_value : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_phase : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output : unsigned(7 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output : device_out_result_t;
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_66a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_3fad_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_f2fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_b6ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_1186_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_5f2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_3d5f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_9c42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_88de_uxn_opcodes_h_l524_l490_DUPLICATE_113e_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
variable REG_VAR_device_out_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
  REG_VAR_device_out_result := device_out_result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right := to_unsigned(3, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_f0e8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l497_c3_f0e8;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_458d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l501_c3_458d;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue := VAR_CLOCK_ENABLE;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := device_out_result;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := device_out_result;
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins := VAR_ins;
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_value := n8;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left := VAR_phase;
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read := VAR_previous_device_ram_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read := VAR_previous_ram_read;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_previous_stack_read;
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_device_address := t8;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output := result.device_ram_address;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d LATENCY=0
     VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output := result.vram_address;

     -- BIN_OP_MINUS[uxn_opcodes_h_l513_c42_1da4] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_left;
     BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output := BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l500_c11_ed22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_left;
     BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output := BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_8fb0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l509_c30_793b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_ins;
     sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_x;
     sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output := sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_opcodes_h_l495_c6_fabc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_left;
     BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output := BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l506_c11_2b14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_left;
     BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output := BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l503_c11_e5c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l495_c6_fabc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l500_c11_ed22_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l503_c11_e5c7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l506_c11_2b14_return_output;
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_phase := VAR_BIN_OP_MINUS_uxn_opcodes_h_l513_c42_1da4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_288e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_ea81_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_1eca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l503_l506_l500_DUPLICATE_9f81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l503_l495_l500_DUPLICATE_f30e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_9f50_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_vram_write_layer_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_a97f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint32_t_opcode_result_t_vram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_be4d_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_device_ram_address_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_d838_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l503_l495_l506_l500_DUPLICATE_3183_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l509_c30_793b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l495_c1_8e37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output;

     -- n8_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output := n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- t8_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output := t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l495_c1_8e37_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_n8_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     -- printf_uxn_opcodes_h_l496_c3_fa1a[uxn_opcodes_h_l496_c3_fa1a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l496_c3_fa1a_uxn_opcodes_h_l496_c3_fa1a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- t8_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- n8_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output := n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- n8_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- t8_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;
     -- n8_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l511_c1_35b1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- Submodule level 5
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l511_c1_35b1_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;
     -- device_out[uxn_opcodes_h_l513_c23_caf9] LATENCY=0
     -- Clock enable
     device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_CLOCK_ENABLE;
     -- Inputs
     device_out_uxn_opcodes_h_l513_c23_caf9_device_address <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_device_address;
     device_out_uxn_opcodes_h_l513_c23_caf9_value <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_value;
     device_out_uxn_opcodes_h_l513_c23_caf9_phase <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_phase;
     device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_device_ram_read;
     device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read <= VAR_device_out_uxn_opcodes_h_l513_c23_caf9_previous_ram_read;
     -- Outputs
     VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output := device_out_uxn_opcodes_h_l513_c23_caf9_return_output;

     -- Submodule level 6
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output;
     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d[uxn_opcodes_h_l520_c25_3d5f] LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_3d5f_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d[uxn_opcodes_h_l519_c29_5f2f] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_5f2f_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.vram_write_layer;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_opcodes_h_l521_c24_9c42] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_9c42_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.is_deo_done;

     -- device_out_result_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output := device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_opcodes_h_l515_c31_3fad] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_3fad_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.device_ram_address;

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_opcodes_h_l516_c21_f2fc] LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_f2fc_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.u8_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_opcodes_h_l514_c32_66a3] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_66a3_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.is_device_ram_write;

     -- CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d[uxn_opcodes_h_l517_c22_b6ec] LATENCY=0
     VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_b6ec_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.ram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_opcodes_h_l518_c26_1186] LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_1186_return_output := VAR_device_out_uxn_opcodes_h_l513_c23_caf9_return_output.is_vram_write;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint16_t_device_out_result_t_ram_address_d41d_uxn_opcodes_h_l517_c22_b6ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_opcodes_h_l521_c24_9c42_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_opcodes_h_l514_c32_66a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_opcodes_h_l518_c26_1186_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_opcodes_h_l519_c29_5f2f_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_opcodes_h_l520_c25_3d5f_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_opcodes_h_l515_c31_3fad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_opcodes_h_l516_c21_f2fc_return_output;
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output := device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l506_c7_729d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output;

     -- Submodule level 8
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l506_c7_729d_return_output;
     -- result_device_ram_address_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l503_c7_7220] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_cond;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output := result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output;

     -- Submodule level 9
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_device_out_result_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l503_c7_7220_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- device_out_result_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l500_c7_8fb0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;

     -- Submodule level 10
     REG_VAR_device_out_result := VAR_device_out_result_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_device_ram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_is_vram_write_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_vram_address_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse := VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l500_c7_8fb0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_vram_address_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_is_device_ram_write_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_vram_write_layer_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_device_ram_address_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l495_c2_4eb3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_88de_uxn_opcodes_h_l524_l490_DUPLICATE_113e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_88de_uxn_opcodes_h_l524_l490_DUPLICATE_113e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_88de(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_vram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_device_ram_address_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_vram_write_layer_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l495_c2_4eb3_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_88de_uxn_opcodes_h_l524_l490_DUPLICATE_113e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_88de_uxn_opcodes_h_l524_l490_DUPLICATE_113e_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
REG_COMB_device_out_result <= REG_VAR_device_out_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
     device_out_result <= REG_COMB_device_out_result;
 end if;
 end if;
end process;

end arch;
